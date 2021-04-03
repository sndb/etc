#!/usr/bin/env bash
# stopwatch
set -e

date1=$(date +%s)

while :; do
	echo -ne "$(date -u -d @$(($(date +%s) - date1)) +%H:%M:%S)\r"
	sleep 0.1
done
