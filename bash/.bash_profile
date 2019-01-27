#
# ~/.bash_profile
#

[[ -f ~/.bashrc ]] && . ~/.bashrc

[[ -f ~/.framebuffer-colors/alduin.sh ]] && . ~/.framebuffer-colors/alduin.sh

export PATH="${PATH}:$HOME/.local/bin"
export EDITOR=nvim
export VISUAL=nvim
export BROWSER=chromium
