#!/bin/sh
# quick edit

dir="$HOME/temp"
file="$dir/temp.org"

$EDITOR "$file"

if [ -w "$file" ] && [ ! -s "$file" ]; then
	rm "$file"
fi
