#!/bin/bash
# colorize the linux virtual console

colors=(
	"3b4252"
	"bf616a"
	"a3be8c"
	"ebcb8b"
	"81a1c1"
	"b48ead"
	"88c0d0"
	"e5e9f0"

	"4c566a"
	"bf616a"
	"a3be8c"
	"ebcb8b"
	"81a1c1"
	"b48ead"
	"8fbcbb"
	"eceff4"
)
n=${#colors[@]}

for ((i = 0; i < n; i++)); do
	printf -v h "%x" "$i"
	echo -ne "\\e]P${h}${colors[$i]}"
done
