#!/bin/sh
reqs=$(cat ./aur.txt)
yay -S $reqs --noconfirm
reqs=$(cat ./standard.txt)
pacman -S $reqs --noconfirm
