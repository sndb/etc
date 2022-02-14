#!/bin/sh

hsetroot -root -cover "$(find ~/.wallpapers -type f | shuf -n 1)"
