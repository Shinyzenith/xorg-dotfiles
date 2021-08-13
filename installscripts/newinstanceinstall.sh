#!/bin/sh
#################################################################################################################
# Run this script only if you're using my spin of arcolinuxb
#################################################################################################################
cd ~/.dotfiles/installscripts/;bash installdependencies.sh
echo "Installed dependencies"
cd ~/.dotfiles/nord-dmenu5.0/; sudo make install
echo "Built dmenu from source"
cd ~/.dotfiles/.config/;/usr/bin/ls -d */ | sed 's/\/$//' | xargs -I {} -n 1 rm -rf ~/.config/{}
cd ~/.dotfiles/.home/;/usr/bin/ls -d */ | sed 's/\/$//' | xargs -I {} -n 1 rm -rf ~/.{}
echo "Removed any config files which may cause conflicts."
cd ~/.dotfiles/.config/;bash install.sh
echo "Symlinked all .config files"
cd ~/.dotfiles/.home/;bash install.sh
echo "Symlinked all .home files"
sudo chsh -s $(which zsh)
~/.config/bspwm/bspwmrc
sudo bash ~/.dotfiles/installscripts/setupshell.sh
