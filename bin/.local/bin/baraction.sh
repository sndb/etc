#!/bin/sh
# dwm status bar

sleep_duration=2

get_volume() {
	volume="$(pulsemixer --get-volume)"
	muted="$(pulsemixer --get-mute)"
	mute_message="muted"

	if [ "$muted" = 1 ]; then
		echo "$mute_message"
	else
		echo "${volume% *}"
	fi
}

get_vpn_status() {
	if pidof "openvpn"; then
		echo "OpenVPN"
	elif ip link | grep -qw wg0; then
		echo "WG"
	else
		echo "off"
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
	xsetroot -name "Net: $(get_netstat)   VPN: $(get_vpn_status)   Vol%: $(get_volume)   $(get_time)"
	sleep $sleep_duration
done
