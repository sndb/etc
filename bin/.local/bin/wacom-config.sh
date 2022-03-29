#!/bin/sh -eu
# configure wacom tablet

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
	echo "$0: device not found"
	exit 1
fi

list="$(xsetwacom list devices)"
pad="$(echo "$list" | awk '/pad/{print $7}')"
stylus="$(echo "$list" | awk '/stylus/{print $7}')"

if [ -z "$pad" ]; then
	echo "$0: pad is empty"
	exit 1
fi

xsetwacom set "$stylus" MapToOutput "$output"
xsetwacom set "$stylus" Area 0 0 15200 8550
