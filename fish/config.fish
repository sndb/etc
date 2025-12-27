if status is-interactive
    alias vim 'nvim'
    alias mkd 'mkdir -vp'
    alias cp 'cp -vi'
    alias mv 'mv -vi'
    alias rm 'rm -vI'
    alias diff 'diff --color=auto'
    alias grep 'grep --color=auto'
    alias ip 'ip -color=auto'
    alias ls 'ls --color=auto'
    alias l 'ls -lhvFA --group-directories-first'
    alias .. 'cd ..'
    alias ... 'cd ../..'
    alias .... 'cd ../../..'
    alias ..... 'cd ../../../..'
    alias ...... 'cd ../../../../..'

    function cl
        cd $argv && l
    end

    set -gx FZF_CTRL_T_OPTS "--walker file,dir,follow --preview 'bat --plain --color=always {}'"
    set -gx FZF_ALT_C_OPTS "--walker dir,follow"
    fzf --fish | source

    bind \co 'set old_tty (stty -g); stty sane; lfcd; stty $old_tty; commandline -f repaint'
end
