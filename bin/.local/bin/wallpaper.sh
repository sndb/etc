#!/bin/sh

hsetroot -cover "$(find ~/.wallpapers -type f | shuf -n 1)"
