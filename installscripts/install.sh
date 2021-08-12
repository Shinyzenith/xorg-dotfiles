#!/bin/sh
cd ~/.dotfiles/misc/;bash clean_env.sh
echo "Removed any config files which may cause conflicts."
cd ~/.dotfiles/.config/;bash install.sh
echo "Symlinked all .config files"
cd ~/.dotfiles/.home/;bash install.sh
echo "Symlinked all .home files"
cd ~/.dotfiles/misc/;bash install_progs.sh
echo "Installed dependencies"
cd ~/.dotfiles/nord-dmenu5.0/; sudo make install
echo "Built dmenu from source"
