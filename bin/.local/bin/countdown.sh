#!/bin/sh -eu
# countdown

date_ref=$(($(date +%s) + $1))

while [ "$date_ref" -ge "$(date +%s)" ]; do
	output=$(date -u -d @$((date_ref - $(date +%s))) +%H:%M:%S)
	printf "%s\r" "$output"
	sleep 0.1
done
