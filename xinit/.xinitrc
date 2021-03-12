#!/bin/sh

# screen settings
xrandr --output DisplayPort-1 --mode 1920x1080 --rate 75 --output HDMI-A-1 --mode 1920x1080 --rate 75 &

# tablet settings

xsetwacom set "Wacom Intuos S Pen stylus" MapToOutput HDMI-A-1 &
xsetwacom set "Wacom Intuos S Pen stylus" Area 0 0 15200 8550 &

# wallpaper
hsetroot -cover ~/pictures/wallpapers/ship1.jpg &

# notification daemon
dunst &

# keyboard layout
setxkbmap -layout us,ru -option grp:alt_shift_toggle,grp_led:scroll &

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

exec dwm
