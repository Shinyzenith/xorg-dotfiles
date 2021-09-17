#!/bin/bash

##################################################################################################################
# Remove all current configs to avoid conflict, will probably make this dynamic later on
##################################################################################################################
rm -rf ~/.config/ranger ~/.moc ~/.config/dunst/ ~/.zprofile ~/.xinitrc ~/.config/alacritty ~/.config/bashtop ~/.config/bspwm ~/.config/nvim ~/.config/bspwm/polybar ~/.config/zathura ~/.gitconfig ~/.config/gtk-3.0 ~/.gtkrc-2.0 ~/.tmux.conf ~/.zshrc ~/.zshrc-personal

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
git clone https://github.com/AakashSharma7269/nord-dmenu-git.git /tmp/dmenugit
cd /tmp/dmenugit
sudo make install
#cd ~/.dotfiles/.assets/mocicon/; sudo make install
cd ~/.dotfiles/.assets/nord-st/;sudo make install

git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm
sudo python3 -m pip install neovim
sudo npm install neovim --global
mkdir -p ~/.bin
mkdir -p ~/.config/nitrogen
mkdir -p ~/.vim/undodir
mkdir -p ~/Desktop
mkdir -p ~/Documents
mkdir -p ~/Downloads
mkdir -p ~/Music
mkdir -p ~/Pictures/screenshots
mkdir -p ~/Videos/recordings
sh -c 'curl -fLo "${XDG_DATA_HOME:-$HOME/.local/share}"/nvim/site/autoload/plug.vim --create-dirs \
       https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
sh -c "$(curl -fsSL https://starship.rs/install.sh)"
sudo mkdir -p /usr/share/zsh/plugins
sudo git clone https://github.com/zsh-users/zsh-autosuggestions /usr/share/zsh-autosuggestions
sudo git clone https://github.com/zsh-users/zsh-syntax-highlighting.git /usr/share/zsh-syntax-highlighting
sudo mkdir -p /usr/share/backgrounds
sudo chown $USER /usr/share/backgrounds/
sudo mkdir -p /usr/share/icons/default
sudo touch /usr/share/icons/default/index.theme
sudo echo "[Icon Theme]" > /usr/share/icons/default/index.theme
sudo echo "Inherits macOSBigSur" >> /usr/share/icons/default/index.theme
cp ~/.config/bspwm/scripts/piratesong ~/.bin/
sudo rm -rf ~/go
sudo cp ~/.dotfiles/.assets/wallpapers/* /usr/share/backgrounds
sudo mkdir -p ~/.config/nitrogen/
cp ~/.dotfiles/bg-saved.cfg ~/.config/nitrogen/bg-saved.cfg
echo "################################################################"
echo "################### Config files placed in the right directories"
echo "################################################################"
