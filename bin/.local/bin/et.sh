#!/bin/sh -eu
# edit text

dir="$HOME/org"
file="$(rg --files "$dir" | dmenu -i -l 20)"

emacs "$file"
