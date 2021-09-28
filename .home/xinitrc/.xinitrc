#!/bin/sh
# ~/.xinitrc
# Executed by startx (run your window manager from here)
/usr/bin/prime-offload &
exec bspwm -c ~/.config/bspwm/bspwmrc
sudo /usr/bin/prime-switch &
