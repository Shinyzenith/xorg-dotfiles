#!/bin/sh
cd ~/.dotfiles/
./100-install-standardrepo-software.sh
./200-install-aur-packages.sh
./300-install-configs.sh
./600-misc-commands.sh
sudo cp ~/.dotfiles/.assets/wallpapers/* /usr/share/backgrounds/
