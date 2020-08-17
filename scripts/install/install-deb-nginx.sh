#!/usr/bin/env bash

echo "===== INSTALL HOMEBREW PACKAGES ====="

ROOTDIR=$(cd "$(dirname "$0")/.." && pwd)

echo '==== Installing nginx... ===='
sudo apt install -y \
	nginx \
	python-certbot-nginx