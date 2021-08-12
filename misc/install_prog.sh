#!/bin/sh
cat ./aur.txt|xargs -I {} yay -S {} --noconfirm
cat ./requirements.txt|xargs -I {} pacman -S {} --noconfirm
