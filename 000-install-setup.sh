#!/bin/sh
cd ~/.dotfiles/
./100-install-packages.sh
./200-install-configs.sh
sudo pacman -Rns --noconfirm iwd dhcpcd # i don't need these anymore
yay -c
