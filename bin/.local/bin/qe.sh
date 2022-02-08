#!/bin/sh
# quick edit

FILE="$HOME/temp/temp.md"

$TERMINAL -e nvim "$FILE"

if [ -w "$FILE" ] && [ ! -s "$FILE" ]; then
	rm "$FILE"
fi
