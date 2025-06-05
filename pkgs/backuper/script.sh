#!/usr/bin/env bash
# Shebang will be overwritten by write shell script bin function, this is just for backwards compatibility.

backuper() {

    # ensuring a file is passed to this script
    if [ -z "$1" ]; then
        echo "Incorrect usage. File argument required. Usage:"
        echo ""
        echo "  $0 <file>"
        echo ""
        exit 1
    fi

    if [ ! -f "$1" ]; then
        echo "Incorrect usage. '$1' is not a file. Usage:"
        echo ""
        echo "  $0 <file>"
        echo ""
        exit 1
    fi

    # creating a tmp file to let them edit first
    file_name=$(basename "$1")
    tmp_file="$(mktemp --directory /tmp/XXXXXX)/$file_name"
    echo "Created backup at $tmp_file."

    cat "$1" > "$tmp_file"

    # opening that file and waiting for them to close it
    : "${EDITOR:=vi}"
    "$EDITOR" "$tmp_file" &
    pid=$!
    wait $pid

    cat "$tmp_file" > "$1"
}

(return 0 2>/dev/null) && export -f backuper || backuper "$@"
