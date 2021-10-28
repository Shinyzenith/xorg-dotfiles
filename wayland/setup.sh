#!/usr/bin/env bash

# window manager minimum needs
sudo aura -S --needed --noconfirm stow
sudo aura -S --needed --noconfirm wlroots
sudo aura -S --needed --noconfirm xorg-xwayland
sudo aura -Aca --needed --noconfirm river-git
sudo aura -Aca --needed --noconfirm rofi-lbonn-wayland-git
sudo aura -Aca --needed --noconfirm swaybg-git
sudo aura -Aca --needed --noconfirm waybar-git

# OBS packages
sudo aura -Aca wlrobs-hg --neded
sudo aura -S pipewire --needed
sudo aura -S obs-studio

# screenshot utilities
sudo aura -S grim --needed --noconfirm
sudo aura -S slurp --needed --noconfirm
sudo aura -S wl-clipboard --needed --noconfirm

#cleaning up orphans
sudo aura -Oj

mv ~/.config/rofi ~/.config/rofi-backup
mv ~/.config/river ~/.config/river-backup
mv ~/.config/waybar ~/.config/waybar-backup
cd ~/.dotfiles/wayland
stow river -t ~/.config/
stow waybar -t ~/.config/
stow rofi -t ~/.config/