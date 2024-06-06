#!/bin/bash
# python brightness_control--.py #old version



# Get the current brightness values
brightness_values=($(xrandr --verbose | grep 'Brightness' | awk '{print $2}'))

# Get the first brightness value (assuming it's the laptop display)
current_brightness=${brightness_values[0]}

# Decrement the brightness by 0.1 (or any other value you prefer)
new_brightness=$(echo "scale=1; $current_brightness - 0.1" | bc)
if (( $(echo "$new_brightness < 0.1" | bc) == 1 )); then
    new_brightness=0.1
fi

# Set the new brightness
xrandr --output eDP --brightness "$new_brightness"

echo "Brightness of eDP changed from $current_brightness to $new_brightness"


