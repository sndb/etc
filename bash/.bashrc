# if not running interactively, don't do anything
[[ $- != *i* ]] && return

# prompt
PS1='[\[\e[1m\]\u\[\e[m\]:\w]\$ '

# options
shopt -s cdspell
shopt -s checkwinsize
shopt -s cmdhist

# aliases
# cd
alias ..='cd ..'
alias ...='cd ../..'
alias ....='cd ../../..'
alias .....='cd ../../../..'
alias ......='cd ../../../../..'
# ls
alias ls='ls --color=auto'
alias l='ls -lhvFA --group-directories-first'
alias ll='ls -lhvF'
alias la='ls -A'
# git
alias ga='git add'
alias gb='git branch'
alias gc='git commit -v'
alias gca='git commit -v -a'
alias gd='git diff'
alias glg='git log --graph'
alias go='git checkout'
alias gp='git push'
alias gs='git status'
# tmux
alias tmux='tmux -u'
alias t='tmux a || tmux'
alias tn='tmux new -s'
alias ta='tmux a -t'
alias tls='tmux ls'
# common
alias c='clear'
alias d='diff --color -r -u'
alias f='find . -name'
alias g='grep'
alias sudo='sudo '
alias v='nvim'
alias x='exit'

# cd and ls in one
cl() {
	local dir="$1"
	local dir="${dir:=$HOME}"
	if [[ -d "$dir" ]]; then
		cd "$dir" >/dev/null; l
	else
		echo "bash: cl: $dir: Directory not found"
	fi
}

# ranger-cd
ranger-cd() {
    temp_file="$(mktemp -t "ranger-cd.XXXXXXXXXX")"
    ranger --choosedir="$temp_file" -- "${@:-$PWD}"
    if chosen_dir="$(cat -- "$temp_file")" && [ -n "$chosen_dir" ] && [ "$chosen_dir" != "$PWD" ]; then
        cd -- "$chosen_dir"
    fi
    rm -f -- "$temp_file"
}

# this binds Ctrl-O to ranger-cd:
bind '"\C-o":"ranger-cd\C-m"'

# fzf integration
. /usr/share/fzf/key-bindings.bash
. /usr/share/fzf/completion.bash

# virtualenvwrapper
export WORKON_HOME=~/.virtualenvs
source /usr/bin/virtualenvwrapper_lazy.sh
