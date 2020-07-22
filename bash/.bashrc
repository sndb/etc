# if not running interactively, don't do anything
[[ $- != *i* ]] && return

# prompt
PS1='[\[\e[1m\]\u\[\e[m\]:\w]\$ '

# options
shopt -s cdspell
shopt -s checkwinsize
shopt -s cmdhist

# aliases
# basics
alias cp='cp -vi'
alias mv='mv -vi'
alias rm='rm -v'
alias ls='ls --color=auto --group-directories-first'
alias diff='diff --color=auto'
alias grep='grep --color=auto'
# cd
alias ..='cd ..'
alias ...='cd ../..'
alias ....='cd ../../..'
alias .....='cd ../../../..'
alias ......='cd ../../../../..'
# ls
alias l='ls -lhvFA'
alias ll='ls -lhvF'
# git
alias ga='git add'
alias gb='git branch'
alias gc='git commit -v'
alias gca='git commit -va'
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
alias sudo='sudo '
alias mkd='mkdir -vp'
alias c='clear'
alias d='diff -ru'
alias v='nvim'
alias x='exit'

# cd and ls in one
cl() {
	cd "$@" && l
}

# ranger-cd
ranger-cd() {
	temp_file="$(mktemp --tmpdir "ranger-cd.XXXXXXXXXX")"
	ranger --choosedir="$temp_file" -- "${@:-$PWD}"
	if chosen_dir="$(cat -- "$temp_file")" && [ -n "$chosen_dir" ] && [ "$chosen_dir" != "$PWD" ]; then
		cd -- "$chosen_dir"
	fi
	rm -f -- "$temp_file"
}

# bind C-o to ranger-cd
bind '"\C-o":"ranger-cd\C-m"'

# fzf integration
. /usr/share/fzf/key-bindings.bash
. /usr/share/fzf/completion.bash

# mcli auto-completion
complete -C /usr/bin/mcli mcli
