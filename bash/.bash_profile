#
# ~/.bash_profile
#

[[ -f ~/.bashrc ]] && . ~/.bashrc

export PATH="${PATH}:$HOME/.local/bin"
export EDITOR=nvim
export VISUAL=nvim
export BROWSER=chromium

export PATH="$HOME/.poetry/bin:$PATH"
