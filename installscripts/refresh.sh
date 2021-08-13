#!/bin/sh
echo $(cd ~/.dotfiles/.config/;/usr/bin/ls -d */ | sed 's|\/$||'| sed 's|\(.*\)\w*|\~/.config/\1|') | xargs -I {} rm -rf {}
echo $(cd ~/.dotfiles/.home/;/usr/bin/ls -d */ | sed 's|\/$||'| sed 's|\(.*\)\w*|\~/.\1|') | xargs -I {} rm -rf {}
echo "Removed any config files which may cause conflicts."
cd ~/.dotfiles/.config/;bash install.sh
echo "Symlinked all .config files"
cd ~/.dotfiles/.home/;bash install.sh
echo "Symlinked all .home files"
cd ~/.dotfiles/nord-dmenu5.0/; sudo make install
echo "Built dmenu from source"
~/.config/bspwm/bspwmrc
