#!/bin/sh
# ~/.xinitrc
# Executed by startx (run your window manager from here)
/usr/bin/prime-offload &
#exec bspwm -c ~/.config/bspwm/bspwmrc
#exec bash /opt/xelph-dwm-git/scripts/autostart.sh
exec dwm
sudo /usr/bin/prime-switch &
