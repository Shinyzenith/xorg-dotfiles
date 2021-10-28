sudo aura -S stow --needed --noconfirm
sudo aura -S wlroots --needed --noconfirm
sudo aura -S xorg-xwayland --nedeed --noconfirm
sudo aura -Aca river-git --needed
sudo aura -Aca rofi-lbonn-wayland-git --needed
sudo aura -Aca swaybg-git --needed
sudo aura -Aca waybar-git --needed
sudo aura -Aca wlrobs-hg --neded
sudo aura -S pipewire --needed
sudo aura -S obs-studio
sudo aura -Oj

mv ~/.config/rofi ~/.config/rofi-backup
mv ~/.config/river ~/.config/river-backup
mv ~/.config/waybar ~/.config/waybar-backup
stow river -t ~/.config/
stow waybar -t ~/.config/
stow rofi -t ~/.config/
