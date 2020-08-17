#!/usr/bin/env bash

echo "===== INSTALL HOMEBREW ====="

if [ -x "$(command -v "brew")" ]; then
	echo "Homebrew is already installed."
else
	/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install.sh)"
fi

echo