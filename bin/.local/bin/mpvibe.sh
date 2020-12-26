#!/usr/bin/env bash

exec mpv --no-video \
         --shuffle \
         -- "$@" "$HOME/music/"
