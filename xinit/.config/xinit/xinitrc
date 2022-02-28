#!/bin/sh

# dpi
xrandr --dpi 96 &

# background
hsetroot -solid "#3b4252" &

# notification daemon
dunst &

# keyboard layout
setxkbmap -layout us,ru -option grp:alt_shift_toggle,grp_led:scroll,ctrl:swapcaps,compose:menu &

# adjust typematic delay and rate
xset r rate 300 50 &

# disable dpms and prevent screen from blanking
xset s off -dpms &

# activate numlock
numlockx &

# setup wacom tablet
wacom-config.sh &

# statusbar script
baraction.sh &

# torrent client
transmission-daemon &

# go documentation server
godoc &

exec dwm
