. ~/.bashrc

export PATH="${PATH}:~/.local/bin"
export EDITOR="nvim"
export VISUAL="$EDITOR"
export BROWSER="chromium"
export FZF_DEFAULT_OPTS="--height=40% --layout=reverse --border=sharp"
export FZF_DEFAULT_COMMAND="rg --files --hidden --no-ignore --follow --no-messages"
export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"