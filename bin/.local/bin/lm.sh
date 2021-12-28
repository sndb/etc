#!/usr/bin/env bash
# listen to music

exec mpv --no-video --shuffle -- "$@" "$HOME/music/"
