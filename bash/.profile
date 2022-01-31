. ~/.bashrc

# basics
export PATH="${PATH}:${HOME}/.local/bin:$(go env GOPATH)/bin"
export HISTSIZE=16384
export LESSHISTFILE=-

# default programs
export EDITOR="nvim"
export VISUAL="$EDITOR"
export BROWSER="chromium"

# start graphical server on tty1 if not already running
[ "$(tty)" = "/dev/tty1" ] && [ ! "$(pgrep -x Xorg)" ] && exec startx
