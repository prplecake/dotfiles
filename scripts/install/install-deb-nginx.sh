#!/usr/bin/env bash

ROOTDIR=$(cd "$(dirname "$0")/.." && pwd)

echo '==== Installing nginx... ===='
sudo apt install -y \
	nginx \
	python-certbot-nginx