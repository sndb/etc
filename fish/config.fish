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

    function y
        set tmp (mktemp -t "yazi-cwd.XXXXXX")
        command yazi $argv --cwd-file="$tmp"
        if read -z cwd < "$tmp"; and [ "$cwd" != "$PWD" ]; and test -d "$cwd"
            builtin cd -- "$cwd"
        end
        command rm -f -- "$tmp"
    end

    set -gx FZF_CTRL_T_OPTS "--walker file,dir,follow --preview 'bat --plain --color=always {}'"
    set -gx FZF_ALT_C_OPTS "--walker dir,follow"
    fzf --fish | source

    zoxide init fish | source
end
