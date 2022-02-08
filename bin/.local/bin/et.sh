#!/bin/sh
# edit text
set -eu

DIR="$HOME/texts/"
FILE="$(rg --files "$DIR" | dmenu -i -l 20)"
$TERMINAL -e nvim "$FILE"
