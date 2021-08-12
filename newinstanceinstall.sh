#!/bin/sh
#################################################################################################################
# Run this script only if you're using my spin of arcolinuxb
#################################################################################################################
cd ~/.dotfiles/misc/;bash clean_env.sh
echo "Removed any config files which may cause conflicts."
cd ~/.dotfiles/.config/;bash install.sh
echo "Symlinked all .config files"
cd ~/.dotfiles/.home/;bash install.sh
echo "Symlinked all .home files"
yay -Rns conky --noconfirm
echo "Removed conky"
mkdir -p ~/.dotfiles/tmp/;cd ~/.dotfiles/tmp/;git clone https://aur.archlinux.org/yay.git;cd yay;makepkg -si --noconfirm
echo "Built yay from source."
sudo rm -rf ~/.dotfiles/tmp/
echo "Removed yay source directory"
cd ~/.dotfiles/misc/;bash install_progs.sh
echo "Installed dependencies"
cd ~/.dotfiles/nord-dmenu5.0/; sudo make install
echo "Built dmenu from source"
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
echo "installed oh my zsh"
sh -c "$(curl -fsSL https://starship.rs/install.sh)"
echo "Installed starship prompt"
sudo chsh -s $(which zsh)
echo "set your default shell"
sudo git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions
echo "add zsh autocomplete"
sudo git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting
echo "add zsh syntax highlighting"

