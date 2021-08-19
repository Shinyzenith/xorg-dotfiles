#!/bin/sh
# ~/.xinitrc
# Executed by startx (run your window manager from here)
/usr/bin/prime-offload
if [ -d /etc/X11/xinit/xinitrc.d ]; then
  for f in /etc/X11/xinit/xinitrc.d/*; do
    [ -x "$f" ] && . "$f"
  done
  unset f
fi
exec bspwm -c ~/.config/bspwm/bspwmrc
sudo /usr/bin/prime-switch
