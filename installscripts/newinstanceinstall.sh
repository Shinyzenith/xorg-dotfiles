#!/bin/sh
nitrogen --set-scaled ~/.dotfiles/misc/wallpaper/wallpaper.png --save
echo "Set the wallpaper"
cd ~/.dotfiles/installscripts/;bash installdependencies.sh
echo "Installed dependencies"
cd ~/.dotfiles/nord-dmenu5.0/; sudo make install
echo "Built dmenu from source"
bash ~/.dotfiles/installscripts/clean.sh
echo "Removed any config files which may cause conflicts."
cd ~/.dotfiles/.config/;bash install.sh
echo "Symlinked all .config files"
cd ~/.dotfiles/.home/;bash install.sh
echo "Symlinked all .home files"
sudo chsh -s $(which zsh)
~/.config/bspwm/bspwmrc
bash ~/.dotfiles/installscripts/setupshell.sh
