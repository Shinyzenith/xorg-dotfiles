#!/bin/bash

# note, set NOPASSWD in sudoers file before running this

##################################################################################################################
# Installing yay (AUR helper)
##################################################################################################################
git clone https://aur.archlinux.org/yay.git /tmp/yay-git-cloned
cd /tmp/yay-git-cloned/
makepkg -sfci
rm -rf /tmp/yay-git-cloned

##################################################################################################################
# Installing AUR packages
##################################################################################################################
yes | yay -S --noconfirm --needed bat
yes | yay -S --noconfirm --needed betterlockscreen
yes | yay -S --noconfirm --needed bitwarden-bin
yes | yay -S --noconfirm --needed brave-bin
yes | yay -S --noconfirm --needed cursor-theme-macos-big-sur
yes | yay -S --noconfirm --needed discord-canary
yes | yay -S --noconfirm --needed freetube-bin
yes | yay -S --noconfirm --needed gotop
yes | yay -S --noconfirm --needed lf
yes | yay -S --noconfirm --needed nordic-darker-theme
yes | yay -S --noconfirm --needed optimus-manager
yes | yay -S --noconfirm --needed optimus-manager-qt
#yes | yay -S --noconfirm --needed paper-icon-theme-git
yes | yay -S --noconfirm --needed picom-ibhagwan-git
yes | yay -S --noconfirm --needed polybar
yes | yay -S --noconfirm --needed timeshift
 
yes | yay -S --noconfirm --needed adobe-source-han-sans-cn-fonts
yes | yay -S --noconfirm --needed adobe-source-han-sans-jp-fonts
yes | yay -S --noconfirm --needed adobe-source-han-sans-kr-fonts
yes | yay -S --noconfirm --needed adobe-source-sans-fonts
yes | yay -S --noconfirm --needed awesome-terminal-fonts
yes | yay -S --noconfirm --needed cherry-font-git
yes | yay -S --noconfirm --needed gsfonts
yes | yay -S --noconfirm --needed nerd-fonts-jetbrains-mono
yes | yay -S --noconfirm --needed nerd-fonts-jetbrains-mono
yes | yay -S --noconfirm --needed nerd-fonts-source-code-pro
yes | yay -S --noconfirm --needed noto-fonts
yes | yay -S --noconfirm --needed otf-font-awesome
yes | yay -S --noconfirm --needed otf-font-awesome-5-free
yes | yay -S --noconfirm --needed terminus-font
yes | yay -S --noconfirm --needed ttf-font-awesome
yes | yay -S --noconfirm --needed ttf-font-logos
yes | yay -S --noconfirm --needed ttf-mac-fonts
yes | yay -S --noconfirm --needed ttf-mac-fonts
yes | yay -S --noconfirm --needed ttf-ubuntu-font-family

echo "################################################################"
echo "################### AUR packages installed"
echo "################################################################"
