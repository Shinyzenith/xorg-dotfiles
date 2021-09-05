#!/bin/bash
git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm
sudo python3 -m pip install neovim
sudo npm install neovim --global
mkdir -p ~/.config/neofetch
mkdir -p ~/.bin
mkdir -p ~/Videos/recordings
mkdir -p ~/Pictures/screenshots
touch -p ~/.config/neofetch/neofetchcache
mkdir -p ~/.vim/undodir
sudo chown $USER /usr/share/backgrounds/
sh -c 'curl -fLo "${XDG_DATA_HOME:-$HOME/.local/share}"/nvim/site/autoload/plug.vim --create-dirs \
       https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
sh -c "$(curl -fsSL https://starship.rs/install.sh)"
sudo mkdir -p /usr/share/zsh/plugins
sudo git clone https://github.com/zsh-users/zsh-autosuggestions /usr/share/zsh/plugins/zsh-autosuggestions
sudo git clone https://github.com/zsh-users/zsh-syntax-highlighting.git /usr/share/zsh/plugins/zsh-syntax-highlighting
echo "################################################################"
echo "################### Misc commands: execution finished."
echo "################################################################"
