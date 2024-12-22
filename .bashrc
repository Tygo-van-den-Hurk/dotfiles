# ~/.bashrc: executed by bash(1) for non-login shells. See /usr/share/doc/bash/examples/startup-files (in the package bash-doc) for examples

# If not running interactively, don't do anything
case $- in
    *i*) ;;
      *) return;;
esac

# make less more friendly for non-text input files, see lesspipe(1)
[ -x /usr/bin/lesspipe ] && eval "$(SHELL=/bin/sh lesspipe)"

alias fzf="fzf --preview 'bat --color=always --style=numbers --line-range=:500 {}'"
alias cat='bat --color=always --line-range=:500 --pager=never'

alias ls="ls -l --group-directories-first"
alias ll='ls -alF --group-directories-first'
alias l='ls'

alias ".."="cd .."
alias "cd.."="cd .."

alias hibernate='systemctl hibernate'
alias alert='notify-send --urgency=low -i "$([ $? = 0 ] && echo terminal || echo error)" "$(history|tail -n1|sed -e '\''s/^\s*[0-9]\+\s*//;s/[;&|]\s*alert$//'\'')"'

# Check for color support and output colored message if supported
ncolors=$(tput colors)
if [[ -n "$ncolors" && "$ncolors" -gt 2 ]]; then

    RED='\033[0;31m'
    GREEN='\033[0;32m'
    YELLOW='\033[1;33m'
    BLUE='\033[0;34m'
    NO_COLOR='\033[0m'

	PS1='[\[\033[1;33m\]\t\[\033[00m\]] \[\033[1;32m\]\u\[\033[0m\]@\[\033[1;32m\]\h\[\033[00m\]:\[\033[1;34m\]\w\[\033[00m\]\$ '        

    alias ls='ls --color=auto -l --group-directories-first'
    alias dir='dir --color=auto'
    alias vdir='vdir --color=auto'
    alias grep='grep --color=auto'
    alias fgrep='fgrep --color=auto'
    alias egrep='egrep --color=auto'
else
    PS1='[\t] \u@\h:\w\$ '
fi

source ~/.config/assets/scripts/preview.sh

export GCC_COLORS='error=01;31:warning=01;35:note=01;36:caret=01;32:locus=01:quote=01'

HISTCONTROL=ignoreboth
HISTSIZE=1000
HISTFILESIZE=2000

shopt -s histappend     # append to the history file, don't overwrite it
shopt -s checkwinsize   # check the window size after each command and, if necessary, update the values of LINES and COLUMNS.
shopt -s globstar       # If set, the pattern "**" used in a pathname expansion context will match all files and zero or more directories and subdirectories.
if ! shopt -oq posix; then
    # enable programmable completion features (you don't need to enable
    # this, if it's already enabled in /etc/bash.bashrc and /etc/profile
    # sources /etc/bash.bashrc).
    if [ -f /usr/share/bash-completion/bash_completion ]; then
        . /usr/share/bash-completion/bash_completion
    elif [ -f /etc/bash_completion ]; then
        . /etc/bash_completion
    fi
fi

export PUID=$(id -u)
export GUID=$(id -g)

# ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ Overrides if packages are present ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ #

if command -v code >/dev/null 2>&1; then
    alias code.="code ."
fi

if command -v eza >/dev/null 2>&1; then
    eza_ignored_files="--ignore-glob 'Desktop|Documents|Downloads|Music|Pictures|Public|Templates|Videos|VirtualBox VMs'"
    eza_options=" --no-quotes --git --long --no-time --smart-group --group-directories-first --icons"
    alias ls="eza $eza_options $eza_ignored_files"
    unset eza_options eza_ignored_files
fi

if command -v zoxide >/dev/null 2>&1; then
    # export _ZO_ECHO="1"
    export _ZO_FZF_OPTS="--preview 'ls \$(echo \$\{\{\}} | cut -d $'\\t' -f2-)'"
    alias cd="z"
    eval "$(zoxide init bash)"
fi

# if oh my posh is installed
if command -v oh-my-posh >/dev/null 2>&1; then
    eval "$(oh-my-posh --init --shell bash --config ~/.poshthemes/Oh-My-Posh/similar-to-bash.omp.json)"
fi

# if fastfetch is installed
if command -v fastfetch >/dev/null 2>&1; then
    alias neofetch="fastfetch"
fi

# Makes kitty **actually** clear the screen and scrollback buffer
if [ "$TERM" == "xterm-kitty" ]; then
    alias clear="printf '\E[H\E[3J'"
fi

eval "$(tailscale completion bash)"
