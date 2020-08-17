#!/usr/bin/env bash

echo "===== INSTALL SHELL ====="

if [ -x "/usr/local/bin/zsh" ]; then
	SHELL_PATH="/usr/local/bin/zsh"
elif [ -x "/usr/bin/zsh" ]; then
	SHELL_PATH="/usr/bin/zsh"
else
	echo "Cannot find zsh. Tried the following paths:"
	echo " - /usr/local/bin/zsh"
	echo " - /usr/bin/zsh"
	exit 1
fi

if [ "$SHELL" == "$SHELL_PATH" ]; then
	echo "$SHELL_PATH is already the login shell."
else
	echo "Setting the login shell to $SHELL_PATH ..."
	grep -q "$SHELL_PATH" /etc/shells || echo "$SHELL_PATH" | sudo tee -a /etc/shells
	sudo chsh -s "$SHELL_PATH" $(whoami)
fi

echo