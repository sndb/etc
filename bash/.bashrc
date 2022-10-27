# if not running interactively, don't do anything
[[ $- != *i* ]] && return

# prompt
PS1='\w \$ '

# options
shopt -s cdspell
shopt -s checkwinsize
shopt -s cmdhist

# aliases: basics
alias cp='cp -vi'
alias mv='mv -vi'
alias rm='rm -vI'
alias diff='diff --color=auto'
alias grep='grep --color=auto'
alias ip='ip -color=auto'
alias ls='ls --color=auto'
alias l='ls -lhFA'

# aliases: cd
alias ..='cd ..'
alias ...='cd ../..'
alias ....='cd ../../..'
alias .....='cd ../../../..'
alias ......='cd ../../../../..'

# aliases: general
alias sudo='sudo '
alias mkd='mkdir -vp'
alias upd='paru'
alias d='diff -ru'
alias e='emacsclient'
alias c='emacs -Q -nw -f full-calc'

# aliases: xdg
alias mbsync='mbsync -c "$XDG_CONFIG_HOME/isync/mbsyncrc"'

# cd and ls in one
cl() {
	cd "$@" && l
}

# fzf integration
. /usr/share/fzf/key-bindings.bash
. /usr/share/fzf/completion.bash

# vterm integration
vterm_printf() {
    if [ -n "$TMUX" ] && ([ "${TERM%%-*}" = "tmux" ] || [ "${TERM%%-*}" = "screen" ] ); then
        # Tell tmux to pass the escape sequences through
        printf "\ePtmux;\e\e]%s\007\e\\" "$1"
    elif [ "${TERM%%-*}" = "screen" ]; then
        # GNU screen (screen, screen-256color, screen-256color-bce)
        printf "\eP\e]%s\007\e\\" "$1"
    else
        printf "\e]%s\e\\" "$1"
    fi
}

vterm_prompt_end() {
    vterm_printf "51;A$(whoami)@$(hostname):$(pwd)"
}
PS1=$PS1'\[$(vterm_prompt_end)\]'
