#!/bin/sh
# quick edit

dir="$HOME/temp"
file="$dir/temp.org"

emacs "$file"

if [ -w "$file" ] && [ ! -s "$file" ]; then
	rm "$file"
fi
