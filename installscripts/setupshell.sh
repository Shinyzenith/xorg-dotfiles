#!/bin/sh
sh -c "$(curl -fsSL https://starship.rs/install.sh)"
echo "Installed starship prompt"
sudo git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions
echo "Added zsh autocomplete"
sudo git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting
echo "Added zsh syntax highlighting"
