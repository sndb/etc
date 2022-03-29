#!/bin/sh -eu
# stopwatch

date_ref=$(date +%s)

while :; do
	output=$(date -u -d @$(($(date +%s) - date_ref)) +%H:%M:%S)
	printf "%s\r" "$output"
	sleep 0.1
done
