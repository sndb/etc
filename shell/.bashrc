[[ $- != *i* ]] && return

PS1='\w \$ '

alias sudo='sudo '
alias e='emacsclient -c'
alias mkd='mkdir -vp'
alias cp='cp -vi'
alias mv='mv -vi'
alias rm='rm -vI'
alias diff='diff --color=auto'
alias grep='grep --color=auto'
alias ip='ip -color=auto'
alias ls='ls --color=auto'
alias l='ls -lhFA'
alias ..='cd ..'
alias ...='cd ../..'
alias ....='cd ../../..'
alias .....='cd ../../../..'
alias ......='cd ../../../../..'

alias sc='systemctl'
alias ssc='sudo systemctl'
alias scu='systemctl --user'
alias jc='journalctl'
alias sjc='sudo journalctl'
alias jcu='journalctl --user'

cl() {
    cd "$@" && l
}

# fzf integration
. /usr/share/fzf/key-bindings.bash
. /usr/share/fzf/completion.bash
