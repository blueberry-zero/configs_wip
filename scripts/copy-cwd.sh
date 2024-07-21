#!/bin/bash

current_dir=$(pwd)

if command -v xsel >/dev/null 2>&1; then
    echo "$current_dir" | xsel --clipboard
else
    echo "Clipboard xsel not found"
    echo "Update script or check xsel availability in path"
fi
