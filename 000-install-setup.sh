#!/bin/sh
cd ~/.dotfiles/
./100-install-packages.sh
cd ~/.dotfiles/
./200-install-configs.sh
sudo pacman -Rns --noconfirm nano firefox iwd dhcpcd # i don't need these anymore
yay -c
cd ~/.bin
wget https://raw.githubusercontent.com/anhsirk0/fetch-master-6000/master/fm6000.pl -O fm6000
mkdir -p ~/.bin
cp ~/.config/bspwm/scripts/piratesong ~/.bin/
cp ~/.config/bspwm/scripts/killprocess ~/.bin/
# for when i fuck up dual boot https://dev.to/nicolasbeauvais/repair-windows-efi-partition-after-a-linux-installation-157o
