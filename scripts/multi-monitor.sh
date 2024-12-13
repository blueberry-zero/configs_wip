#!/bin/bash

# Monitor names (defaults)
laptop_monitor="eDP-1"
# left_monitor="${1:-DP-1-1.1}"  # Use 1st argument or default
# right_monitor="${2:-DP-1-1.2}" # Use 2nd argument or default

left_monitor="${1:-DP-1-0.1}"  # Use 1st argument or default
right_monitor="${2:-DP-1-0.2}" # Use 2nd argument or default

# Configure external monitors
xrandr \
  --output "$left_monitor" --auto --left-of "$right_monitor" \
  --output "$right_monitor" --auto

# Turn off laptop monitor
xrandr --output "$laptop_monitor" --off
