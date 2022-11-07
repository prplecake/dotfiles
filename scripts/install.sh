#!/usr/bin/env bash

ROOTDIR=$(cd "$(dirname "$0")" && pwd)

source "$ROOTDIR/_helpers"

# install tools
if [[ "$OSTYPE" == linux-gnu* ]]; then
	if [[ -x "/etc/debian_version" || -x "/etc/" ]]; then
		confirm "Install Debian/Ubuntu packages?" && "$ROOTDIR/src/install-debian-ubuntu-pkgs.sh"
	fi
	confirm "Set hostname?" 				&& "$ROOTDIR/src/install-set-hostname.sh"
	confirm "Install node_exporter?"		&& "$ROOTDIR/src/install-node-exporter.sh"
elif [[ "$OSTYPE" == darwin* ]]; then
	confirm "Install Homebrew?"				&& "$ROOTDIR/src/install-homebrew.sh"
	confirm "Install Homebrew packages?"	&& "$ROOTDIR/src/install-homebrew-packages.sh"
	confirm "Install Sublime {Text,Merge} CLI helpers?" && "$ROOTDIR/src/install-macos-subl-smerge-helpers.sh"
fi

# Update submodules
cd $ROOTDIR/..; git submodule update --init; cd -

# Extra steps
confirm "Set login shell?"	&& "$ROOTDIR/src/install-shell.sh"
confirm "Create symlinks?"	&& "$ROOTDIR/src/install-symlinks.sh"

if [[ -e "$ROOTDIR/src/set_hostname" ]]; then
	confirm "Hostname was changed. Reboot?" && reboot=1
fi

if [[ $reboot == 1 ]]; then
	rm "$ROOTDIR/src/set_hostname"
	sudo reboot
fi
