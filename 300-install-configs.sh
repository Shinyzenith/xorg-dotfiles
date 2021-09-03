#!/bin/bash

##################################################################################################################
# Remove all current configs to avoid conflict, will probably make this dynamic later on
##################################################################################################################
rm -rf ~/.config/ranger ~/.moc ~/.config/dunst/ ~/.zprofile ~/.xinitrc ~/.config/alacritty ~/.config/bashtop ~/.config/bspwm ~/.config/lf ~/.config/nvim ~/.config/bspwm/polybar ~/.config/zathura ~/.gitconfig ~/.gtkrc-2.0.mine ~/.tmux.conf ~/.zshrc ~/.zshrc-personal

##################################################################################################################
# Added config files to ~/.config/
##################################################################################################################
cd ~/.dotfiles/.config/
dots=$(ls -d */)
for dot in $dots
do
	stow -D $dot -t ~/.config
	stow $dot -t ~/.config
done

##################################################################################################################
# Added config files to ~/
##################################################################################################################
cd ~/.dotfiles/.home/
dots=$(ls -d */)
for dot in $dots
do
	stow -D $dot -t ~/
	stow $dot -t ~/
done
cd ~/.dotfiles/.assets/nord-dmenu5.0/; sudo make install
cd ~/.dotfiles/.assets/mocicon/; sudo make install
cd ~/.dotfiles/.assets/nord-st/;sudo make install
echo "################################################################"
echo "################### Config files placed in the right directories"
echo "################################################################"
