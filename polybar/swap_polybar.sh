#!/usr/bin/env bash

# Terminate polybar instances
polybar-msg cmd quit

config_file="/home/sjaan/.config/polybar/config.ini"
# Launch polybar
polybar -c "$config_file" monitor0
# polybar -c /home/sjaan/.config/polybar/config.ini monitor1
# polybar -c /home/sjaan/.config/polybar/config.ini monitor2
#!/bin/bash


if [ "$POLYBAR_MONITOR" = "MULTI_HOME" ]; then
    # Single monitor configuration
    polybar -c "$config_file" monitor0
    export POLYBAR_MONITOR="LAPTOP"
elif [ "$POLYBAR_MONITOR" = "LAPTOP" ]; then
    # Double monitor configuration 
    polybar -c "$config_file" monitor1  # Uncomment if you have a second monitor
    polybar -c "$config_file" monitor2  # Uncomment if you have a third monitor
    export POLYBAR_MONITOR="MULTI_HOME"
fi

export POLYBAR_MONITOR="LAPTOP"
