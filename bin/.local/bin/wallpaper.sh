#!/bin/sh

hsetroot -root -cover "$(find "$XDG_DATA_HOME/wallpapers" -type f | shuf -n 1)"
