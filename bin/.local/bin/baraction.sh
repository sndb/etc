#!/bin/sh
# dwm status bar

SLEEP=2

get_volume() {
	VOLUME="$(pulsemixer --get-volume)"
	MUTE="$(pulsemixer --get-mute)"
	MUTE_MESSAGE="muted"

	if [ "$MUTE" = 1 ]; then
		RET="$MUTE_MESSAGE"
	else
		RET="${VOLUME% *}"
	fi

	echo "$RET"
}

get_vpn_status() {
	if pidof "openvpn"; then
		echo "Y (OVPN)"
	elif ip link | grep -qw wg0; then
		echo "Y (WG)"
	else
		echo "N"
	fi
}

get_netstat() {
	RX=$(traffic.sh | cut -d ' ' -f 1)
	TX=$(traffic.sh | cut -d ' ' -f 2)
	echo "↓ $((RX / 1024)) KiB ↑ $((TX / 1024)) KiB"
}

get_time() {
	date +"%Y-%m-%d %H:%M"
}

while :; do
	xsetroot -name "Net: $(get_netstat)   VPN: $(get_vpn_status)   Vol%: $(get_volume)   $(get_time)"
	sleep $SLEEP
done
