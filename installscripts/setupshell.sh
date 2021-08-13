#!/bin/sh
sh -c "$(curl -fsSL https://starship.rs/install.sh)"
echo "Installed starship prompt"
sudo git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions
echo "Added zsh autocomplete"
