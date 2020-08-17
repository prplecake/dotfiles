#!/usr/bin/env bash

ROOTDIR=$(cd "$(dirname "$0")" && pwd)

source "$ROOTDIR/_helpers"

# install tools
if [[ "$OSTYPE" == linux-gnu* ]]; then
	if [[ -x "/etc/debian_version" || -x "/etc/" ]]; then
		confirm "Install Debian/Ubuntu packages?" && "$ROOTDIR/install/install-debian-ubuntu-pkgs.sh"
	fi
	confirm "Set hostname?" 				&& "$ROOTDIR/install/install-set-hostname.sh"
	confirm "Install node_exporter?"		&& "$ROOTDIR/install/install-node-exporter.sh"
elif [[ "$OSTYPE" == darwin* ]]; then
	confirm "Install Homebrew?"				&& "$ROOTDIR/install/install-homebrew.sh"
	confirm "Install Homebrew packages?"	&& "$ROOTDIR/install/install-homebrew-packages.sh"
fi

# Extra steps
confirm "Set login shell?"	&& "$ROOTDIR/install/install-shell.sh"
confirm "Create symlinks?"	&& "$ROOTDIR/install/install-symlinks.sh"

if [[ -e "$ROOTDIR/install/set_hostname" ]]; then
	confirm "Hostname was changed. Reboot?" && reboot=1
fi

if [[ $reboot == 1 ]]; then
	rm "$ROOTDIR/install/set_hostname"
	sudo reboot
fi