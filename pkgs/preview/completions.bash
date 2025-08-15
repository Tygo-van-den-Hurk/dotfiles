# shellcheck shell=bash

_preview() {
    local cur prev
    COMPREPLY=()
    cur="${COMP_WORDS[COMP_CWORD]}"
    prev="${COMP_WORDS[COMP_CWORD-1]}"

    case "$prev" in
        -c | --color | --colour)
            COMPREPLY=( $(compgen -W "always never auto" -- "$cur") )
            return 0
            ;;
    esac

    # suggest flags if current word starts with -
    if [[ "$cur" == --color=* || "$cur" == --colour=* ]]; then
        local opts="--color=auto --color=never --color=always --colour=auto --colour=never --colour=always"
        COMPREPLY=( $(compgen -W "$opts" -- "$cur") )
        return 0
    elif [[ "$cur" == -* ]]; then
        local opts="--help --ascii --tree --verbose --version --color --color= --"
        COMPREPLY=( $(compgen -W "$opts" -- "$cur") )
        return 0
    fi

    # otherwise, suggest files/dirs
    COMPREPLY=( $(compgen -df -- "$cur") )
    return 0
}

complete -F _preview preview
