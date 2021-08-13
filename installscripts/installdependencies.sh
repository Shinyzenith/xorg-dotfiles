#!/bin/sh
echo $(cat ./aur.txt)|xargs -I {} yay -S {} --noconfirm
echo $(cat ./standard.txt)|xargs -I {} pacman -S {} --noconfirm
