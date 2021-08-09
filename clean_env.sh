#!/bin/sh
dots=$(ls -d */ | grep -v ^_)
rm -rf ~/.zshrc ~/.zshrc-personal ~/.config/bspwm ~/.config/Alacritty ~/.config/lf ~/.config/polybar ~/.config/zathura ~/.config/ ~/.config/nvim
for dot in $dots
do
	stow -D $dot
done
