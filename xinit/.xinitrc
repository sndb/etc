#!/bin/sh

# dpi
xrandr --dpi 96

# wallpaper
hsetroot -solid "#000" &

# notification daemon
dunst &

# keyboard layout
setxkbmap -layout us,ru -option grp:alt_shift_toggle,grp_led:scroll,ctrl:nocaps &

# adjust typematic delay and rate
xset r rate 300 50 &

# disable dpms and prevent screen from blanking
xset s off -dpms &

# activate numlock
numlockx &

# statusbar script
baraction.sh &

# torrent client
transmission-daemon &

# go documentation server
godoc &

exec dwm
