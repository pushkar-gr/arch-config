#!/bin/bash

# Get a list of windows from hyprctl clients
clients=$(hyprctl clients | grep "Window" | awk -F"-> " '{print $2}' | awk -F":" '{print $1}')

# Debug: Print the list of clients
echo "Available windows:" >&2
echo "$clients" >&2

# Use wofi to select a window
selected=$(echo "$clients" | wofi --dmenu --prompt "Switch to:")

# Debug: Print the selected window
echo "Selected window: $selected" >&2

# Focus the selected window
if [ -n "$selected" ]; then
    # Use the title regex to focus the window
    hyprctl dispatch focuswindow "title:^(${selected})$"
else
    echo "No window selected." >&2
fi
