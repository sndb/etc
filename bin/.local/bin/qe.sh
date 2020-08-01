#!/usr/bin/env bash

FILE=$(mktemp "$HOME/temp/tempedit_XXXXX")

alacritty -e nvim "$FILE"

if [ ! -s "$FILE" ]; then
	rm "$FILE"
fi
