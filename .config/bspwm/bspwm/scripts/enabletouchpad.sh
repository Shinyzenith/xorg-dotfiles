#!/bin/sh
export DISPLAY=:0
touchpad=$(xinput --list | grep -i -m 1 "touchpad" | grep -o 'id=[0-9]\+' | grep -o '[0-9]\+')
xinput set-int-prop $touchpad "Device Enabled" 8 1;notify-send "Touchpad Enabled" --icon="$icon" -t 2000 -a "Touch pad script"
