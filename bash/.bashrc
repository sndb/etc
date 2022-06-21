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
alias l='ls -lhvFA --group-directories-first --time-style=long-iso'

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

# aliases: xdg
alias mbsync='mbsync -c "$XDG_CONFIG_HOME/isync/mbsyncrc"'

# cd and ls in one
cl() {
	cd "$@" && l
}

# ranger integration
ranger-cd() {
	temp_file="$(mktemp --tmpdir "ranger-cd.XXXXXXXXXX")"
	ranger --choosedir="$temp_file" -- "${@:-$PWD}"
	if chosen_dir="$(cat -- "$temp_file")" && [ -n "$chosen_dir" ] && [ "$chosen_dir" != "$PWD" ]; then
		cd -- "$chosen_dir"
	fi
	rm -f -- "$temp_file"
}
bind '"\C-o":"ranger-cd\C-m"'

# fzf integration
. /usr/share/fzf/key-bindings.bash
. /usr/share/fzf/completion.bash
