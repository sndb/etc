. "$HOME/.bashrc"

export HISTSIZE=65536
export LANG="en_US.UTF-8"

# xdg base directory
export XDG_CACHE_HOME="$HOME/.cache"
export XDG_CONFIG_HOME="$HOME/.config"
export XDG_DATA_HOME="$HOME/.local/share"
export XDG_STATE_HOME="$HOME/.local/state"

# custom paths
export CARGO_HOME="$XDG_DATA_HOME/cargo"
export GOPATH="$XDG_DATA_HOME/go"
export PASSWORD_STORE_DIR="$XDG_DATA_HOME/pass"
export ELECTRUMDIR="$XDG_DATA_HOME/electrum"
export ZIG_DIR="$XDG_DATA_HOME/zig"
export ODIN_DIR="$XDG_DATA_HOME/odin"
export PATH="$PATH:$HOME/.local/bin:$ODIN_DIR:$ZIG_DIR:$GOPATH/bin:$CARGO_HOME/bin"
export ICEAUTHORITY="$XDG_CACHE_HOME/ICEauthority"

# history files
export HISTFILE="$XDG_STATE_HOME/bashhst"
export SQLITE_HISTORY="$XDG_STATE_HOME/sqlitehst"
export PSQL_HISTORY="$XDG_STATE_HOME/psqlhst"
export REDISCLI_HISTFILE="$XDG_STATE_HOME/redishst"

# default programs
export EDITOR="emacsclient -c"
export VISUAL="$EDITOR"
export PAGER="less"
export LESS="iRM"

# google
export GOSUMDB="off"
export GOPROXY="direct"
