#!/bin/sh
# countdown
set -eu

DATE_REF=$(($(date +%s) + $1))

while [ "$DATE_REF" -ge "$(date +%s)" ]; do
	OUTPUT=$(date -u -d @$((DATE_REF - $(date +%s))) +%H:%M:%S)
	printf "%s\r" "$OUTPUT"
	sleep 0.1
done
