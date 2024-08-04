#!/bin/bash

target="$1"

# Check if the argument exists
if [ ! -e "$target" ]; then
    echo "Error: '$target' does not exist."
    exit 1
fi

# Determine if it's a file or directory
if [ -f "$target" ]; then
    # It's a file, so get the parent directory
    working_dir="$(dirname "$target")"
elif [ -d "$target" ]; then
    # It's already a directory
    working_dir="$target"
else
    echo "Error: '$target' is not a regular file or directory."
    exit 1
fi

# Launch Alacritty with the correct working directory
nohup alacritty --working-directory="$working_dir" > /dev/null &

