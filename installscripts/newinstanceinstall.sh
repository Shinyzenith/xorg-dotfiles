#!/bin/sh
#################################################################################################################
# Run this script only if you're using my spin of arcolinuxb
#################################################################################################################
echo "Updating your system!!!"
yay -Syu --noconfirm
cd ~/.dotfiles/misc/;bash install_prog.sh
echo "Installed dependencies"
cd ~/.dotfiles/nord-dmenu5.0/; sudo make install
echo "Built dmenu from source"
cd ~/.dotfiles/installscripts/;bash clean_env.sh
echo "Removed any config files which may cause conflicts."
cd ~/.dotfiles/.config/;bash install.sh
echo "Symlinked all .config files"
cd ~/.dotfiles/.home/;bash install.sh
echo "Symlinked all .home files"
~/.config/bspwm/bspwmrc
sudo chsh -s $(which zsh)
sudo bash ~/.dotfiles/installscripts/setupshell.sh
