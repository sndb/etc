#!/bin/sh
# quick edit

filename="temp.org"
tempfile="$HOME/temp/$filename"

$TERMINAL -e $EDITOR "$tempfile"

if [ -w "$tempfile" ] && [ ! -s "$tempfile" ]; then
	rm "$tempfile"
fi
