#!/usr/bin/env bash

echo "===== INSTALL SUBL & SMERGE CLI HELPERS ====="

ROOTDIR=$(cd "$(dirname "$0")/.." && pwd)

LOCAL_BIN=/usr/local/bin
SUBL_PATH="/Applications/Sublime Text.app/Contents/SharedSupport/bin/subl"
SMERGE_PATH="/Applications/Sublime Merge.app/Contents/SharedSupport/bin/smerge"

if ! [ -x "$SUBL_PATH" ]; then
	echo "Sublime Text isn't installed."
else
	if [ -x "$LOCAL_BIN/subl" ]; then
		echo "subl helper is already linked."
	else
		sudo ln -s "$SUBL_PATH" "$LOCAL_BIN"
	fi
fi


if ! [ -x "$SMERGE_PATH" ]; then
	echo "Sublime Merge isn't installed."
else
	if [ -x "$LOCAL_BIN/smerge" ]; then
		echo "smerge helper is already linked."
	else
		sudo ln -s "$SMERGE_PATH" "$LOCAL_BIN"
	fi
fi

echo
