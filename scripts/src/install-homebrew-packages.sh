#!/usr/bin/env bash

echo "===== INSTALL HOMEBREW PACKAGES ====="

ROOTDIR=$(cd "$(dirname "$0")/.." && pwd)

brew tap homebrew/bundle
brew tap homebrew/cask
brew tap homebrew/cask-fonts
brew tap homebrew/core
brew tap homebrew/services

# Install required tools and programs
brew install \
	caddy \
	dash \
	diction \
	font-go \
	font-go-mono \
	git \
	gnupg \
	go \
	gotop \
	mtr \
	nmap \
	node \
	postgresql \
	rbenv-bundler \
	ripgrep \
	ruby \
	thefuck \
	tmux \
	tree \
	weechat \
	youtube-dl \
	zsh

echo
