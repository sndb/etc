. "$HOME/.bashrc"

export HISTSIZE=65536
export LANG="en_US.UTF-8"

# xdg base directory
export XDG_CACHE_HOME="$HOME/.cache"       # /var/cache
export XDG_CONFIG_HOME="$HOME/.config"     # /etc
export XDG_DATA_HOME="$HOME/.local/share"  # /usr/share
export XDG_STATE_HOME="$HOME/.local/state" # /var/lib

# paths
export CARGO_HOME="$XDG_DATA_HOME/cargo"
export GOPATH="$XDG_DATA_HOME/go"
export SQLITE_HISTORY="$XDG_DATA_HOME/sqlite/history"
export PSQL_HISTORY="$XDG_DATA_HOME/psql/history"
export HISTFILE="$XDG_DATA_HOME/bash/history"
export INPUTRC="$XDG_CONFIG_HOME/readline/inputrc"
export LESSHISTFILE="-"
export PASSWORD_STORE_DIR="$XDG_DATA_HOME/pass"
export XAUTHORITY="$XDG_RUNTIME_DIR/Xauthority"
export XINITRC="$XDG_CONFIG_HOME/xinit/xinitrc"
export ELECTRUMDIR="$XDG_DATA_HOME/electrum"
export PATH="$PATH:$HOME/bin:$GOPATH/bin:$CARGO_HOME/bin"

# default programs
export BROWSER="brave"
export EDITOR="emacsclient -c"
export ALTERNATE_EDITOR="mg -n"
export VISUAL="$EDITOR"
export PAGER="less"
export LESS="iRM"
export TERMINAL="st"
export FZF_DEFAULT_OPTS="--color=no"

# google
export GOSUMDB="off"
export GOPROXY="direct"

# start graphical server on tty1 if not already running
[ "$(tty)" = "/dev/tty1" ] && [ ! "$(pgrep -x Xorg)" ] && exec startx "$XINITRC"
