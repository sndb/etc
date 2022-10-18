#!/bin/sh
# update dwm status bar in the infinite loop

cooldown=2

get_volume() {
	volume="$(pulsemixer --get-volume)"
	muted="$(pulsemixer --get-mute)"
	if [ "$muted" = 1 ]; then
		echo "--"
	else
		echo "${volume% *}"
	fi
}

get_netstat() {
	rx=$(traffic.sh | cut -d ' ' -f 1)
	tx=$(traffic.sh | cut -d ' ' -f 2)
	echo "↓ $((rx / 1024)) KiB ↑ $((tx / 1024)) KiB"
}

get_time() {
	date +"%Y-%m-%d %H:%M"
}

while :; do
	xsetroot -name "Net: $(get_netstat)   Vol%: $(get_volume)   $(get_time)"
	sleep $cooldown
done
