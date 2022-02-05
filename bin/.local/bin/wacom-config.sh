#!/bin/sh
# configure wacom tablet
set -eu

OUTPUT="HDMI-0"
DEVICE_FOUND=false

for i in $(seq 5); do
	if xsetwacom list devices | grep -q "Wacom"; then
		DEVICE_FOUND=true
		break
	fi
	sleep "$i"
done

if [ "$DEVICE_FOUND" = false ]; then
	exit
fi

LIST="$(xsetwacom list devices)"
PAD="$(echo "$LIST" | awk '/pad/{print $7}')"
STYLUS="$(echo "$LIST" | awk '/stylus/{print $7}')"

if [ -z "$PAD" ]; then
	exit
fi

xsetwacom set "$STYLUS" MapToOutput "$OUTPUT"
xsetwacom set "$STYLUS" Area 0 0 15200 8550
