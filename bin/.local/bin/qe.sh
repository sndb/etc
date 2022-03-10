#!/bin/sh
# quick edit

file="$HOME/temp/$(date +%F).md"

$TERMINAL -e nvim "$file"

if [ -w "$file" ] && [ ! -s "$file" ]; then
	rm "$file"
fi
