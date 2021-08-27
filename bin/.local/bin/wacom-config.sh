#!/usr/bin/env bash
# configure wacom tablet
set -e

for i in $(seq 5); do
	if xsetwacom list devices | grep -q "Wacom"; then
		break
	fi
	sleep "$i"
done

list="$(xsetwacom list devices)"
pad="$(echo "$list" | awk '/pad/{print $7}')"
stylus="$(echo "$list" | awk '/stylus/{print $7}')"

if [ -z "$pad" ]; then
	exit
fi

xsetwacom set "$stylus" MapToOutput HDMI-A-1
xsetwacom set "$stylus" Area 0 0 15200 8550
