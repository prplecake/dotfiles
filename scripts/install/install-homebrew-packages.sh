#!/usr/bin/env bash

echo "===== INSTALL HOMEBREW PACKAGES ====="

ROOTDIR=$(cd "$(dirname "$0")/.." && pwd)

# Install required tools and programs
brew install \
	caddy \
	go \
	gotop \
	mtr \
	nmap \
	ripgrep \
	tmux \
	tree \
	weechat \
	youtube-dl \
	zsh

echo