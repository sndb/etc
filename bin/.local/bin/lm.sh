#!/bin/sh
# listen to music

exec mpv --no-video --shuffle -- "$@" "$HOME/music/"
