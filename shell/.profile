. "$HOME/.bashrc"

export HISTSIZE=65536
export LANG="en_US.UTF-8"

# xdg base directory
export XDG_CACHE_HOME="$HOME/.cache"
export XDG_CONFIG_HOME="$HOME/.config"
export XDG_DATA_HOME="$HOME/.local/share"
export XDG_STATE_HOME="$HOME/.local/state"
# XDG_RUNTIME_DIR is set by default to /run/user/$UID

# custom paths
export CARGO_HOME="$XDG_DATA_HOME/cargo"
export GOPATH="$XDG_DATA_HOME/go"
export INPUTRC="$XDG_CONFIG_HOME/readline/inputrc"
export PASSWORD_STORE_DIR="$XDG_DATA_HOME/pass"
export XAUTHORITY="$XDG_RUNTIME_DIR/Xauthority"
export XINITRC="$XDG_CONFIG_HOME/xinit/xinitrc"
export ELECTRUMDIR="$XDG_DATA_HOME/electrum"
export LEIN_HOME="$XDG_DATA_HOME/lein"
export PATH="$PATH:$HOME/bin:$GOPATH/bin:$CARGO_HOME/bin"

# history files
export HISTFILE="$XDG_STATE_HOME/bashhst"
export SQLITE_HISTORY="$XDG_STATE_HOME/sqlitehst"
export PSQL_HISTORY="$XDG_STATE_HOME/psqlhst"
export NODE_REPL_HISTORY="$XDG_STATE_HOME/nodehst"
export REDISCLI_HISTFILE="$XDG_STATE_HOME/redishst"

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
