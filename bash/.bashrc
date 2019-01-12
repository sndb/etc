#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return


# prompt
# PROMPT_COMMAND=__prompt_command
# or
PS1='[\[\e[1m\]\u\[\e[m\]:\w]\$ '

__prompt_command() {
	local EXIT="$?"
	local BLACK="\[$(tput setaf 0)\]"
	local RED="\[$(tput setaf 1)\]"
	local GREEN="\[$(tput setaf 2)\]"
	local YELLOW="\[$(tput setaf 3)\]"
	local BLUE="\[$(tput setaf 4)\]"
	local MAGENTA="\[$(tput setaf 5)\]"
	local CYAN="\[$(tput setaf 6)\]"
	local WHITE="\[$(tput setaf 7)\]"
	local BBLACK="\[$(tput setaf 8)\]"
	local RESET="\[$(tput sgr0)\]"
	PS1=""
	if [ $EXIT != 0 ]; then
		local STATUS="${RED}${EXIT}"
	else
		local STATUS="${GREEN}${EXIT}"
	fi
	PS1+="${BLUE}\u${BBLACK}@${CYAN}\h ${BBLACK}[${STATUS}${BBLACK}] [${YELLOW}\w${BBLACK}]\n"
	PS1+="${BBLACK}>> ${RESET}"
}


# options
shopt -s cdspell
shopt -s checkwinsize
shopt -s cmdhist


# aliases
# autocolor
alias ls='ls --color=auto'
alias dir='dir --color=auto'
alias vdir='vdir --color=auto'
alias grep='grep --color=auto'
alias fgrep='fgrep --color=auto'
alias egrep='egrep --color=auto'
# cd
alias ..='cd ..'
alias ...='cd ../..'
alias ....='cd ../../..'
alias .....='cd ../../../..'
alias ......='cd ../../../../..'
# ls
alias l='ls -lhvFA --group-directories-first'
alias ll='ls -lhvF'
alias la='ls -A'
# vim
alias v='nvim'
alias vi='nvim'
alias vim='nvim'
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
alias t='tmux attach || tmux new'
alias tn='tmux new -s'
alias ta='tmux a -t'
alias tls='tmux ls'
# general
alias c='clear'
alias x='exit'
alias sudo='sudo '
alias ansic='gcc -std=c89 -pedantic -Wall -Wextra -Os'
alias f='find . -name'
alias d='diff --color -r -u'
alias g='grep'
alias vol='alsamixer'
alias df='df -h'
alias du='du -c -h'
alias free='free -m'
alias mkdir='mkdir -p -v'
alias chright='chmod -R a=r,a+X,u+w'
alias mntusb='mount -o gid=users,fmask=113,dmask=002'
alias tl2='tree -L 2'


# functions
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
