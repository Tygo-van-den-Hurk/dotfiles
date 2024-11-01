#!/usr/bin/env bash

# shows a preview of a file in the terminal
function preview() {

    # making sure at least 1 argument is given.
    if [ -z "$1" ]; then
        echo "Usage: preview <file>"
        return 1
    fi

    # if it's a directory
    if [ -d "$1" ]; then

        # if EZA is installed
        if command -v eza >/dev/null 2>&1; then
            eza_ignored_files="--ignore-glob 'Desktop|Documents|Downloads|Music|Pictures|Public|Templates|Videos|VirtualBox VMs'"
            eza_options=" --no-quotes --git --long --no-time --smart-group --group-directories-first --icons"
            eval "eza $eza_options $eza_ignored_files $1"
            unset eza_options eza_ignored_files
            return 0
        fi
        
        return ls -l $1
    fi

    filename=$(basename -- "$1")
    extension="${filename##*.}"
    if [[ "$filename" == "$extension" ]]; then # if no file extention then it's a text file
        bat --color=always --line-range=:500 --pager=never $1
        return 0
    fi
    
    case "$extension" in
        jpg | jpeg | png | gif | svg | ico )
            if [[ "$TERM_PROGRAM" == "xterm-kitty" ]] || [[ "$TERM" == "xterm-kitty" ]]; then
                kitten icat $1
            else
                tiv $1
            fi
            ;;
        txt | md | \
        log | logs | \
        yml | yaml | config | conf |  toml | json | \
        nix | java | sh | c | h | js | ts | rs | ini )
            bat --color=always --line-range=:500 --pager=never $1
            ;;
        pdf)
            echo "Haven't found a program to preview PDF's in the terminal yet..."
            ;;
        html)
            echo "Haven't found a program to preview HTML's files in the terminal yet..."
            ;;
        *)
            bat --color=always --line-range=:500 --pager=never $1
            echo -e "[$(echo $YELLOW)WARNING!$(echo $NO_COLOR)] : The extension: \"$(echo $GREEN)$extension$(echo $NO_COLOR)\" does not have a default spefified. Add this in your bashrc. Attempted to open it with \"$(echo $RED)bat$(echo $NO_COLOR)\""
            ;;
    esac
    
    return 0
}
