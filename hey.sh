#!/bin/bash

COMMANDS_FILE="/usr/local/bin/commands.toml"

print_all_commands() {
    echo "All commands:"
    cat "$COMMANDS_FILE" | grep -vE "^\s*$" | grep -vE "^#"
}

print_commands() {
    local key=$1

    # Check if the key is empty
    if [ -z "$key" ]; then
        echo "Usage: hey <command>"
        echo "Commands:"
        echo "  add <main_command> <new_command>"
        echo "    Add a new command"
        echo "  <command>"
        echo "    Show the command"
        echo "  ls"
        echo "    List all commands"
        exit 1
    fi

    local value=$(grep -E "^$key" "$COMMANDS_FILE" | cut -d '=' -f2 | tr -d '"' | tr -d '[:space:]')

    if [ -z "$value" ]; then
        echo "Key '$key' not found."
    else
        echo "Value of key '$key': $value"
    fi
}

add_command() {
    local key=$1
    local value=$2

    # Check if the key already exists in the TOML file
    if grep -q "^$key = " "$COMMANDS_FILE"; then
        echo "Key '$key' already exists."
        echo "\tUse another key to add a new command."
        echo "\tOr use use characters like $key-version2 to add a new command."
        echo "\tAnd make sure to use 'hey ls' to see all commands."
    else
        # If the key doesn't exist, add it to the file
        if [ ! -f "$COMMANDS_FILE" ]; then
            echo "# Commands" >> "$COMMANDS_FILE"
        fi
        echo "$key = \"$value\"" >> "$COMMANDS_FILE"
        echo "'$key' command has been added."
    fi
}


case "$1" in
    add)
        if [ -z "$2" ] || [ -z "$3" ]; then
            echo "Usage: hey add <main_command> <new_command>"
            exit 1
        fi
        add_command "$2" "$3"
        ;;
    ls)
        print_all_commands
        ;;
    *)
        print_commands "$1"
        ;;
esac
