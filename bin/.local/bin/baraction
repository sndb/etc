#!/usr/bin/env bash

sleep_sec=3

bg_def="+@bg=0;"
bg_blk="+@bg=1;"
bg_red="+@bg=2;"
bg_grn="+@bg=3;"
bg_ylw="+@bg=4;"
bg_blu="+@bg=5;"
bg_mag="+@bg=6;"
bg_cyn="+@bg=7;"
bg_wht="+@bg=8;"

fg_def="+@fg=0;"
fg_blk="+@fg=1;"
fg_red="+@fg=2;"
fg_grn="+@fg=3;"
fg_ylw="+@fg=4;"
fg_blu="+@fg=5;"
fg_mag="+@fg=6;"
fg_cyn="+@fg=7;"
fg_wht="+@fg=8;"

get_volume () {
	local volume mute mute_message
	volume="$(pulsemixer --get-volume)"
	mute="$(pulsemixer --get-mute)"
	mute_message="${fg_red} muted${fg_def}"

	if ((mute == 1)); then
		local vol="$mute_message"
	else
		local vol="${fg_blu} ${volume% *}${fg_def}"
	fi

	echo "$vol"
}

get_vpn_status () {
	if pidof "openvpn"; then
		echo "${fg_grn} Y (OVPN)${fg_def}"
	elif ip link | grep -qw wg0; then
		echo "${fg_grn} Y (WG)${fg_def}"
	else
		echo "${fg_red} N${fg_def}"
	fi
}

get_netstat () {
	read -r rx tx <<< "$(traffic)"
	echo "${fg_blu} ↓ $((rx/1024))${fg_def} KiB${fg_mag} ↑ $((tx/1024))${fg_def} KiB"
}

while :; do
	echo -e "Net:$(get_netstat) - VPN:$(get_vpn_status) - Vol%:$(get_volume) -"
	sleep $sleep_sec
done
