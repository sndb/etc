. ~/.bashrc

# xdg base directory
export XDG_CACHE_HOME="$HOME/.cache"       # /var/cache
export XDG_CONFIG_HOME="$HOME/.config"     # /etc
export XDG_DATA_HOME="$HOME/.local/share"  # /usr/share
export XDG_STATE_HOME="$HOME/.local/state" # /var/lib

# paths
export CARGO_HOME="$XDG_DATA_HOME/cargo"
export GOPATH="$XDG_DATA_HOME/go"
export HISTFILE="$XDG_DATA_HOME/bash/history"
export INPUTRC="$XDG_CONFIG_HOME/readline/inputrc"
export LESSHISTFILE="-"
export PASSWORD_STORE_DIR="$XDG_DATA_HOME/pass"
export XAUTHORITY="$XDG_RUNTIME_DIR/Xauthority"
export XINITRC="$XDG_CONFIG_HOME/xinit/xinitrc"
export PATH="$PATH:$HOME/.local/bin/private:$HOME/.local/bin:$GOPATH/bin:$CARGO_HOME/bin"

# default programs
export BROWSER="brave"
export EDITOR="emacsclient"
export ALTERNATE_EDITOR=""
export VISUAL="$EDITOR"
export MANPAGER="less -R --use-color -Dd+r -Du+b"
export TERMINAL="st"
export FZF_DEFAULT_COMMAND="fd --type f --follow --hidden --exclude .git"
export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"

# bash history size
export HISTSIZE=65536

# start graphical server on tty1 if not already running
[ "$(tty)" = "/dev/tty1" ] && [ ! "$(pgrep -x Xorg)" ] && exec startx "$XINITRC"
