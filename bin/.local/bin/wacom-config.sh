#!/usr/bin/env bash
# configure wacom tablet
set -e

output="HDMI-0"

device_found=false

for i in $(seq 5); do
	if xsetwacom list devices | grep -q "Wacom"; then
		device_found=true
		break
	fi
	sleep "$i"
done

if [ "$device_found" = false ]; then
	exit
fi

list="$(xsetwacom list devices)"
pad="$(echo "$list" | awk '/pad/{print $7}')"
stylus="$(echo "$list" | awk '/stylus/{print $7}')"

if [ -z "$pad" ]; then
	exit
fi

xsetwacom set "$stylus" MapToOutput "$output"
xsetwacom set "$stylus" Area 0 0 15200 8550
