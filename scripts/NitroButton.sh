#!/bin/bash

# Find keyboard device
DEVICE=$(grep -A 5 -B 5 "keyboard\|Keyboard" /proc/bus/input/devices | grep -m 1 "event" | sed 's/.*event\([0-9]\+\).*/\/dev\/input\/event\1/')

if [ -z "$DEVICE" ]; then
    systemd-cat -t nitrobutton-script echo "Error: Could not find keyboard device."
    exit 1
fi

# Check permissions
if [ ! -r "$DEVICE" ]; then
    systemd-cat -t nitrobutton-script echo "Error: Cannot read $DEVICE (permission denied)."
    exit 1
fi

# Main functionality
exec evtest "$DEVICE" | grep --line-buffered "code 425.*value 1" | while read -r line; do
    /opt/acersense/gui/AcerSense &
done