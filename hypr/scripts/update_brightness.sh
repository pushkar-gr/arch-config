#!/bin/bash

# Get the current brightness level as a percentage (e.g., 5% -> 5, 20% -> 20)
current_brightness=$(brightnessctl g)
max_brightness=$(brightnessctl m)
brightness_percentage=$(( current_brightness * 100 / max_brightness ))

# Check the action (increase or decrease)
if [[ $1 == "up" ]]; then
    if [[ $brightness_percentage -lt 10 ]]; then
        # If brightness is below 10%, increase by 1%
        brightnessctl s +1%
    else
        # Otherwise, increase by 10%
        brightnessctl s +10%
    fi
elif [[ $1 == "down" ]]; then
    if [[ $brightness_percentage -le 10 ]]; then
        # If brightness is 10% or below, decrease by 1%
        brightnessctl s 1%- # Decrease by 1%
    else
        # Otherwise, decrease by 10%
        brightnessctl s 10%-
    fi
fi
