#!/bin/sh
yay
echo $(cat ./standard.txt)|xargs -I {} pacman -S {} --noconfirm
echo $(cat ./aur.txt)|xargs -I {} yay -S {} --noconfirm
