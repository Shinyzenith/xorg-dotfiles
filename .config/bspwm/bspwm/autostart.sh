#!/bin/bash
function run {
  if ! pgrep $1 ;
  then
    $@&
  fi
}

#Find out your monitor name with xrandr or arandr (save and you get this line)
#xrandr --output VGA-1 --primary --mode 1360x768 --pos 0x0 --rotate normal
#xrandr --output DP2 --primary --mode 1920x1080 --rate 60.00 --output LVDS1 --off &
#xrandr --output LVDS1 --mode 1366x768 --output DP3 --mode 1920x1080 --right-of LVDS1
#xrandr --output HDMI2 --mode 1920x1080 --pos 1920x0 --rotate normal --output HDMI1 --primary --mode 1920x1080 --pos 0x0 --rotate normal --output VIRTUAL1 --off
#autorandr horizontal
$HOME/.config/bspwm/polybar/launch.sh &

#change your keyboard if you need it
#setxkbmap -layout be

# switching out capslock with escape key
xmodmap -e "keycode 9 = Caps_Lock"; xmodmap -e "keycode 66 = Escape"
xmodmap -e 'clear Lock' -e 'keycode 0x42 = Escape'

#music server icon
#killall mocicon
#mocicon &

# fix mouse on arch
~/.dotfiles/.config/bspwm/bspwm/scripts/enableclickontap.sh

#draw your wallpaper
nitrogen --restore

xsetroot -cursor_name left_ptr &
killall sxhkd
run sxhkd -c ~/.config/bspwm/sxhkd/sxhkdrc &

run nm-applet &
numlockx on &
#blueberry-tray & # Uncomment this if you want bluetooth on boot
killall picom
picom --experimental-backends --config $HOME/.config/bspwm/picom.conf &
/usr/lib/polkit-gnome/polkit-gnome-authentication-agent-1 &
killall dunst
exec dunst &

# vim navigation rates
xset r rate 350 60
# sets the currently saved wallpaper as the betterlockscreen cache image
betterlockscreen -u $(cat ~/.config/nitrogen/bg-saved.cfg | grep file | sed 's/file=//g')
