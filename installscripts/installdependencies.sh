#!/bin/sh
yay
echo $(cat ./standard.txt)|xargs -I {} sudo pacman -S {} --noconfirm
echo $(cat ./aur.txt)|xargs -I {} yay -S {} --noconfirm
