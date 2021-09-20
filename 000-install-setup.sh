#!/bin/sh
cd ~/.dotfiles/
./100-install-packages.sh
cd ~/.dotfiles/
./200-install-configs.sh
sudo pacman -Rns --noconfirm firefox iwd dhcpcd # i don't need these anymore
yay -c
# for when i fuck up dual boot https://dev.to/nicolasbeauvais/repair-windows-efi-partition-after-a-linux-installation-157o
