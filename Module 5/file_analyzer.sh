#!/bin/bash

log_file="errors.log"
log_error() {
    echo "[ERROR] $1" | tee -a "$log_file" >&2
}
#help menu using here doc
show_help() {
cat <<EOF
Usage: $0 [OPTIONS]

Options:
  -d <directory>   Recursively search a directory
  -k <keyword>     Keyword to search (required)
  -f <file>        Search directly inside a file
  --help           Display this help menu

Examples:
  $0 -d logs -k error
  $0 -f errors.log -k empty
  $0 --help
EOF
}
#searching directory function
search_directory() {
    local dir="$1"
    local keyword="$2"

    for item in "$dir"/*; do
        if [ -f "$item" ]; then
            if grep -q "$keyword" "$item"; then
                echo "Keyword found in: $item"
            fi
        elif [ -d "$item" ]; then
            search_directory "$item" "$keyword"
        fi
    done
}

if [ $# -eq 0 ]; then
    log_error "No arguments given"
    exit 1
fi

if [[ "$@" == *"--help"* ]]; then
    show_help
    exit 0
fi

while getopts ":d:k:f:" opt; do
    case $opt in
        d) DIR="$OPTARG" ;;
        k) KEYWORD="$OPTARG" ;;
        f) FILE="$OPTARG" ;;
        \?)
            log_error "invalid option: -$OPTARG"
            exit 1
            ;;
        :)
            log_error "option -$OPTARG require args"
            exit 1
            ;;
    esac
done

#regex
if [[ -z "$KEYWORD" || ! "$KEYWORD" =~ ^[a-zA-Z0-9_]+$ ]]; then
    log_error "invalid or empty keyword"
    exit 1
fi

#here string
if [ -n "$FILE" ]; then
    if [ ! -f "$FILE" ]; then
        log_error "file don't exist: $FILE"
        exit 1
    fi

    echo "Searching: $FILE"
    grep "$KEYWORD" <<< "$(cat "$FILE")"
    echo "exit status: $?"
    exit 0
fi

if [ -n "$DIR" ]; then
    if [ ! -d "$DIR" ]; then
        log_error "dir does not exist: $DIR"
        exit 1
    fi

    echo "recursively searching: $DIR"
    search_directory "$DIR" "$KEYWORD"
    echo "exit status: $?"
    exit 0
fi

log_error "invalid use"
exit 1
