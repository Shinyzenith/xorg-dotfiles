#!/bin/sh
#################################################################################################################
# Run this script only if you're using my spin of arcolinuxb
#################################################################################################################
cd ~/.dotfiles/installscripts/;bash installdependencies.sh
echo "Installed dependencies"
cd ~/.dotfiles/nord-dmenu5.0/; sudo make install
echo "Built dmenu from source"
echo $(cd ~/.dotfiles/.config/;/usr/bin/ls -d */ | sed 's|\/$||'| sed 's|\(.*\)\w*|\~/.config/\1|') | xargs -I {} rm -rf {}
echo $(cd ~/.dotfiles/.home/;/usr/bin/ls -d */ | sed 's|\/$||'| sed 's|\(.*\)\w*|\~/.\1|') | xargs -I {} rm -rf {}
echo "Removed any config files which may cause conflicts."
cd ~/.dotfiles/.config/;bash install.sh
echo "Symlinked all .config files"
cd ~/.dotfiles/.home/;bash install.sh
echo "Symlinked all .home files"
sudo chsh -s $(which zsh)
~/.config/bspwm/bspwmrc
bash ~/.dotfiles/installscripts/setupshell.sh
