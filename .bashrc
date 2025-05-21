[[ $- != *i* ]] && return

PS1='\w \$ '

alias sudo='sudo '
alias mkd='mkdir -vp'
alias cp='cp -vi'
alias mv='mv -vi'
alias rm='rm -vI'
alias diff='diff --color=auto'
alias grep='grep --color=auto'
alias ip='ip -color=auto'
alias ls='ls --color=auto'
alias l='ls -lhvFA --group-directories-first'
alias ..='cd ..'
alias ...='cd ../..'
alias ....='cd ../../..'
alias .....='cd ../../../..'
alias ......='cd ../../../../..'

cl() {
	cd "$@" && l
}

# fzf integration
. /usr/share/fzf/key-bindings.bash
. /usr/share/fzf/completion.bash
