#!/usr/bin/env bash

ROOTDIR=$(cd "$(dirname "$0")" && pwd)

source "$ROOTDIR/_helpers"

# install tools
if [[ "$OSTYPE" == linux-gnu* ]]; then
	if [[ -x "/etc/debian_version" || -x "/etc/"]]
		confirm "Install Debian/Ubuntu packages?" && "$ROOTDIR/install/install-debian-ubuntu-pkgs.sh"
	fi
elif [[ "$OSTYPE" == darwin* ]]; then
	confirm "Install Homebrew?"				&& "$ROOTDIR/install/install-homebrew.sh"
	confirm "Install Homebrew packages?"	&& "$ROOTDIR/install/install-homebrew-packages.sh"
fi

# Extra steps
confirm "Set login shell?"	&& "$ROOTDIR/install/install-shell.sh"
confirm "Create symlinks?"	&& "$ROOTDIR/install/install-symlinks.sh"