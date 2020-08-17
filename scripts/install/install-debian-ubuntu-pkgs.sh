#!/usr/bin/env bash

echo "===== INSTALL DEBIAN/UBUNTU PACKAGES ====="

ROOTDIR=$(cd "$(dirname "$0")/.." && pwd)

source "$ROOTDIR/_helpers"

echo "Installing apt packages..."
sudo apt install -y \
	nginx \
	python-certbot-nginx \
	thefuck \
	tmux \
	tree \
	zsh

echo "Installing gotop..."
curl -s https://api.github.com/repos/xxxserxxx/gotop/releases/latest \
| grep "browser_download_url.*linux_amd64" \
| cut -d : -f 2,3 \
| tr -d \" \
| xargs -I {} curl -L "{}" -o /tmp/gotop.tgz
sudo tar xzvf /tmp/gotop.tgz -C /usr/bin/

confirm_n "Install Nginx?" && "$ROOTDIR/install/install-deb-nginx.sh"