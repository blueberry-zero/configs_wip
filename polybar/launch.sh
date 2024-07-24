#!/usr/bin/env bash

# Terminate polybar instances
polybar-msg cmd quit

# Launch polybar
polybar -c /home/sjaan/.config/polybar/config.ini monitor0
# polybar -c /home/sjaan/.config/polybar/config.ini monitor1
# polybar -c /home/sjaan/.config/polybar/config.ini monitor2
