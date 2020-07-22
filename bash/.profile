. ~/.bashrc

# basics
export PATH="${PATH}:${HOME}/.local/bin"
export HISTSIZE=16384

# default programs
export EDITOR="nvim"
export VISUAL="$EDITOR"
export BROWSER="chromium"

# fzf settings
export FZF_DEFAULT_OPTS="--height=40% --layout=reverse --border=sharp"
export FZF_DEFAULT_COMMAND="rg --files --hidden --no-ignore --follow --no-messages --glob \"!.git\""
export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"
export FZF_ALT_C_COMMAND="fd --type directory --hidden --no-ignore --follow --exclude \".git\""

# start graphical server on tty1 if not already running
[ "$(tty)" = "/dev/tty1" ] && [ ! "$(pgrep -x Xorg)" ] && exec startx
