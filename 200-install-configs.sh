#!/bin/bash

##################################################################################################################
# Remove all current configs to avoid conflict, will probably make this dynamic later on
##################################################################################################################
rm -rf ~/.config/ranger ~/.moc ~/.config/dunst/ ~/.zprofile ~/.xinitrc ~/.config/alacritty ~/.config/bashtop ~/.config/bspwm ~/.config/nvim ~/.config/bspwm/polybar ~/.config/zathura ~/.gitconfig ~/.config/gtk-3.0 ~/.tmux.conf ~/.zshrc ~/.zshrc-personal

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
#cd ~/.dotfiles/.assets/mocicon/; sudo make install
#cd ~/.dotfiles/.assets/nord-st/;sudo make install

git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm
sudo python3 -m pip install neovim
sudo npm install neovim --global
mkdir -p ~/.config/neofetch
mkdir -p ~/.bin
mkdir -p ~/Videos/recordings
mkdir -p ~/Pictures/screenshots
touch -p ~/.config/neofetch/neofetchcache
mkdir -p ~/.vim/undodir
sh -c 'curl -fLo "${XDG_DATA_HOME:-$HOME/.local/share}"/nvim/site/autoload/plug.vim --create-dirs \
       https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
sh -c "$(curl -fsSL https://starship.rs/install.sh)"
sudo mkdir -p /usr/share/zsh/plugins
sudo git clone https://github.com/zsh-users/zsh-autosuggestions /usr/share/zsh/plugins/zsh-autosuggestions
sudo git clone https://github.com/zsh-users/zsh-syntax-highlighting.git /usr/share/zsh/plugins/zsh-syntax-highlighting
mkdir -p ~/.icons/default
sudo mkdir -p /usr/share/backgrounds
sudo chown $USER /usr/share/backgrounds/
touch ~/.icons/default/index.theme
echo "[Icon Theme]" >> ~/.icons/default/index.theme
echo "Inherits macOSBigSur" >> ~/.icons/default/index.theme
sudo ln -s /usr/share/icons/macOSBigSur/cursors ~/.icons/default/cursors
cp ~/.config/bspwm/scripts/piratesong ~/.bin/
sudo rm -rf ~/go
sudo cp ~/.dotfiles/.assets/wallpapers/* /usr/share/backgrounds
echo "################################################################"
echo "################### Config files placed in the right directories"
echo "################################################################"
