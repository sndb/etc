#!/usr/bin/env bash
# edit text
set -eux

dir="$HOME/texts/"
file="$(rg --files "$dir" | dmenu -i -l 20)"
alacritty -e nvim "$file"
