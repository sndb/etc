#!/usr/bin/env bash
# countdown
set -e

date1=$(($(date +%s) + $1))

while [ "$date1" -ge "$(date +%s)" ]; do
	echo -ne "$(date -u -d @$((date1 - $(date +%s))) +%H:%M:%S)\r"
	sleep 0.1
done
