#!/usr/bin/env bash

echo "===== INSTALL HOMEBREW PACKAGES ====="

ROOTDIR=$(cd "$(dirname "$0")/.." && pwd)

sudo apt install \
	nginx \
	python-certbot-nginx