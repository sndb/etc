#!/usr/bin/env bash

if [[ "$1" == *([.0-9])?(s) ]]; then
	unit="second"
elif [[ "$1" == *([.0-9])m ]]; then
	unit="minute"
elif [[ "$1" == *([.0-9])h ]]; then
	unit="hour"
elif [[ "$1" == *([.0-9])d ]]; then
	unit="day"
else
	unit="..what?"
fi

number="${1%[smhd]}"

if [ "$number" != 1 ]; then
	pluralize="s have"
else
	pluralize=" has"
fi

sleep "$1" && notify-send "Timer" "$number $unit$pluralize passed." # && timeout 3 pacat --volume=32768 /dev/urandom