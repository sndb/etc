#!/usr/bin/env bash
# quick edit

FILE="$HOME/temp/temp.md"

alacritty -e nvim "$FILE"

if [ -w "$FILE" ] && [ ! -s "$FILE" ]; then
	rm "$FILE"
fi
