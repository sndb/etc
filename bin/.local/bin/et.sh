#!/bin/sh
# edit text
set -eu

dir="$HOME/texts"
file="$(rg --files "$dir" | dmenu -i -l 20)"
emacs "$file"
