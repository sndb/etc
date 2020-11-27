#!/usr/bin/env bash

sleep_sec=3

get_volume () {
	local volume mute mute_message ret
	volume="$(pulsemixer --get-volume)"
	mute="$(pulsemixer --get-mute)"
	mute_message="muted"

	if ((mute == 1)); then
		ret="$mute_message"
	else
		ret="${volume% *}"
	fi

	echo "$ret"
}

get_vpn_status () {
	if pidof "openvpn"; then
		echo "Y (OVPN)"
	elif ip link | grep -qw wg0; then
		echo "Y (WG)"
	else
		echo "N"
	fi
}

get_netstat () {
	read -r rx tx <<< "$(traffic.sh)"
	echo "↓ $((rx/1024)) KiB ↑ $((tx/1024)) KiB"
}

get_time () {
	date +"%Y-%m-%d %H:%M"
}

while :; do
	xsetroot -name "Net: $(get_netstat)   VPN: $(get_vpn_status)   Vol%: $(get_volume)   $(get_time)"
	sleep $sleep_sec
done
