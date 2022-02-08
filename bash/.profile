. ~/.bashrc

# basics
export GOPATH="$HOME/.go"
export PATH="${PATH}:${HOME}/.local/bin:$(go env GOPATH)/bin"
export HISTSIZE=32768
export LESSHISTFILE=-

# default programs
export TERMINAL="st"
export EDITOR="nvim"
export VISUAL="$EDITOR"
export BROWSER="chromium"

# start graphical server on tty1 if not already running
[ "$(tty)" = "/dev/tty1" ] && [ ! "$(pgrep -x Xorg)" ] && exec startx
