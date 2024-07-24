#!/bin/bash

# Monitor names (replace with your actual monitor names from `xrandr`)
laptop_monitor="eDP-1"
left_monitor="DP-1-1.1"
right_monitor="DP-1-1.2"

# Turn on laptop monitor 
xrandr --output "$laptop_monitor" --auto

# Disable external monitors
xrandr --output "$left_monitor" --off --output "$right_monitor" --off

polybar_launch s
