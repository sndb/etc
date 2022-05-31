#!/bin/sh -eu
# fuzzy find the file under ~/org and edit it

dir="$HOME/org"
file="$(rg --files "$dir" | dmenu -i -l 20)"

$EDITOR "$file"
