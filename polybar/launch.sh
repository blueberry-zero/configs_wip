#!/usr/bin/env bash

# Terminate polybar instances
polybar-msg cmd quit

# Launch polybar
# polybar -c /home/sjaan/.config/polybar/config.ini monitor0
# polybar -c /home/sjaan/.config/polybar/config.ini monitor1
# polybar -c /home/sjaan/.config/polybar/config.ini monitor2
#!/bin/bash

# Check if an argument is provided
if [ $# -eq 0 ]; then
    echo "Error: No argument provided (s or d for single or double monitor)."
    exit 1
fi

# Get the first argument
option="$1"

# Path to your Polybar config file
config_file="/home/sjaan/.config/polybar/config.ini"

# Check the argument's value
if [ "$option" = "s" ]; then
    # Single monitor configuration
    polybar -c "$config_file" monitor0
elif [ "$option" = "d" ]; then
    # Double monitor configuration 
    # polybar -c "$config_file" monitor0
    polybar -c "$config_file" monitor1  # Uncomment if you have a second monitor
    polybar -c "$config_file" monitor2  # Uncomment if you have a third monitor
else
    echo "Error: Invalid argument. Use 's' for single monitor or 'd' for double monitor."
    exit 1
fi
