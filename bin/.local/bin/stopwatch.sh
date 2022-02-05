#!/bin/sh
# stopwatch
set -eu

DATE_REF=$(date +%s)

while :; do
	OUTPUT=$(date -u -d @$(($(date +%s) - DATE_REF)) +%H:%M:%S)
	printf "%s\r" "$OUTPUT"
	sleep 0.1
done
