# shellcheck shell=bash

_nbcat() {
    local cur prev
    COMPREPLY=()
    cur="${COMP_WORDS[COMP_CWORD]}"
    prev="${COMP_WORDS[COMP_CWORD-1]}"

    # suggest flags if current word starts with -
    if  [[ "$cur" == -* ]]; then
        local opts="-h --help -v --version -d --debug -p --page"
        COMPREPLY=( $(compgen -W "$opts" -- "$cur") )
        return 0
    fi

    # otherwise, suggest files/dirs
    COMPREPLY=( $(compgen -df -- "$cur") )
    return 0
}

complete -F _nbcat nbcat
