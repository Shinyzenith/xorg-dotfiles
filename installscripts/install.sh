#!/bin/sh
rm -rf ~/.xinitrc ~/.config/alacritty ~/.config/bashtop ~/.config/bspwm ~/.config/lf ~/.config/nvim ~/.config/bspwm/polybar ~/.config/zathura ~/.gitconfig ~/.gtkrc-2.0.mine ~/.tmux.conf ~/.zshrc ~/.zshrc-personal
echo "Removed any config files which may cause conflicts."
cd ~/.dotfiles/.config/;bash install.sh
echo "Symlinked all .config files"
cd ~/.dotfiles/.home/;bash install.sh
echo "Symlinked all .home files"
cd ~/.dotfiles/installscripts/nord-dmenu5.0/; sudo make install
echo "Built dmenu from source"
