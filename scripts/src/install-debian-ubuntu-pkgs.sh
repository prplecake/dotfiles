#!/usr/bin/env bash

echo "===== INSTALL DEBIAN/UBUNTU PACKAGES ====="

ROOTDIR=$(cd "$(dirname "$0")/.." && pwd)

source "$ROOTDIR/_helpers"

echo "==== Updating package information ===="
sudo apt update

echo "==== Upgrading apt packages ===="
sudo apt upgrade -y

echo "==== Installing apt packages... ===="
sudo apt install -y --ignore-missing \
	apt-transport-https \
	gnupg gnupg1 gnupg2 \
	net-tools \
	python3-distutils \
	thefuck \
	tmux \
	tree \
	zsh

echo "==== Installing gotop... ===="
if [[ -x /usr/bin/gotop ]]; then
	echo "gotop is already installed."
else
	curl -s https://api.github.com/repos/xxxserxxx/gotop/releases/latest \
	| grep "browser_download_url.*linux_amd64" \
	| cut -d : -f 2,3 \
	| tr -d \" \
	| xargs -I {} curl -L "{}" -o /tmp/gotop.tgz
	sudo tar xzvf /tmp/gotop.tgz -C /usr/bin/
	sudo rm /tmp/gotop.tgz
fi

confirm_n "Install Nginx?" && "$ROOTDIR/install/install-deb-nginx.sh"