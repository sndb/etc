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
export MANPAGER="less -R --use-color -Dd+r -Du+b"

# tty font and colorscheme
case $(tty) in
/dev/tty*)
	console-colors.sh
	setfont ter-120n
	;;
esac

# start graphical server on tty1 if not already running
[ "$(tty)" = "/dev/tty1" ] && [ ! "$(pgrep -x Xorg)" ] && exec startx
