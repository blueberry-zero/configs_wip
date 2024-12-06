#!/bin/bash

polybar-msg cmd quit

# Path to your Polybar config file
config_file="/home/sjaan/.config/polybar/config.ini"
#
# Check if an argument is provided
if [ $# -eq 0 ]; then
    polybar -c "$config_file" monitor0
    export POLYBAR_MONITOR="LAPTOP"

    exit 0
fi

# Get the first argument
option="$1"

# Check the argument's value
if [ "$option" = "s" ]; then
    # Single monitor configuration
    polybar -c "$config_file" monitor0
    export POLYBAR_MONITOR="LAPTOP"
elif [ "$option" = "d" ]; then
    # Double monitor configuration 
    polybar -c "$config_file" monitor1  # Uncomment if you have a second monitor
    polybar -c "$config_file" monitor2  # Uncomment if you have a third monitor
    export POLYBAR_MONITOR="MULTI_HOME"
fi
