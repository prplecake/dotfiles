#!/usr/bin/env bash

echo "===== INSTALL DEBIAN/UBUNTU PACKAGES ====="

ROOTDIR=$(cd "$(dirname "$0")/.." && pwd)

source "$ROOTDIR/_helpers"

echo "==== Installing node_exporter... ===="

if ! id "monitor" &>/dev/null; then
	sudo useradd -m monitor
fi

if [[ -x /usr/local/bin/node_exporter ]]; then
	echo "node_exporter is already installed."
else
	curl -s https://api.github.com/repos/prometheus/node_exporter/releases/latest \
	| grep "browser_download_url.*linux-amd64" \
	| cut -d : -f 2,3 \
	| tr -d \" \
	| xargs -I {} curl -L "{}" -o /tmp/node_exporter.tar.gz
	mkdir -p /tmp/node_exporter
	tar xzf /tmp/node_exporter.tar.gz -C /tmp/node_exporter
	sudo cp $(find /tmp -type f -name 'node_exporter' 2>/dev/null) /usr/local/bin/
	rm -rf /tmp/node_exporter
	sudo rm /tmp/node_exporter.tar.gz
fi

node_exporter_service="
[Unit]
Description=Node Exporter for Prometheus
After=network.target

[Service]
User=monitor
ExecStart=/usr/local/bin/node_exporter
ExecReload=/bin/kill $MAINPID
KillMode=process
Restart=on-failure

[Install]
WantedBy=multi-user.target
"

echo "$node_exporter_service" | sudo tee /etc/systemd/system/node-exporter.service >/dev/null
sudo systemctl daemon-reload
sudo systemctl enable node-exporter
sudo systemctl start node-exporter