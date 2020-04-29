. ~/.bashrc

export PATH="${PATH}:~/.local/bin"

export HISTSIZE=8192

export EDITOR="nvim"
export VISUAL="$EDITOR"
export BROWSER="chromium"

export FZF_DEFAULT_OPTS="--height=40% --layout=reverse --border=sharp"
export FZF_DEFAULT_COMMAND="rg --files --hidden --no-ignore --follow --no-messages --glob \"!.git\""
export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"
export FZF_ALT_C_COMMAND="fd --type directory --hidden --no-ignore --follow --exclude \".git\""

export BAT_THEME="Nord"
