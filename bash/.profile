. ~/.bashrc

# basics
export GOPATH="${HOME}/go"
export PATH="${PATH}:${HOME}/.local/bin:${GOPATH}/bin"
export HISTSIZE=16384

# default programs
export EDITOR="nvim"
export VISUAL="$EDITOR"
export BROWSER="chromium"

# start graphical server on tty1 if not already running
[ "$(tty)" = "/dev/tty1" ] && [ ! "$(pgrep -x Xorg)" ] && exec startx
