#!/bin/bash
git clone https://aur.archlinux.org/yay.git /tmp/yay-git-cloned
cd /tmp/yay-git-cloned/
makepkg -sfci
rm -rf /tmp/yay-git-cloned

yay -S --noconfirm --needed lf
yay -S --noconfirm --needed tlpui-git
yay -S --noconfirm --needed bitwarden-bin
yay -S --noconfirm --needed polybar
yay -S --noconfirm --needed betterlockscreen
yay -S --noconfirm --needed brave-bin
yay -S --noconfirm --needed paper-icon-theme
yay -S --noconfirm --needed gotop
yay -S --noconfirm --needed discord-canary
yay -S --noconfirm --needed nordic-darker-theme
yay -S --noconfirm --needed picom-ibhagwan-git
yay -S --noconfirm --needed freetube-bin
yay -S --noconfirm --needed bat

yay -S --noconfirm --needed adobe-source-han-sans-cn-fonts
yay -S --noconfirm --needed otf-font-awesome-5-free
yay -S --noconfirm --needed ttf-font-logos
yay -S --noconfirm --needed adobe-source-han-sans-jp-fonts
yay -S --noconfirm --needed adobe-source-han-sans-kr-fonts
yay -S --noconfirm --needed adobe-source-sans-fonts
yay -S --noconfirm --needed awesome-terminal-fonts
yay -S --noconfirm --needed cherry-font-git
yay -S --noconfirm --needed gsfonts
yay -S --noconfirm --needed nerd-fonts-jetbrains-mono
yay -S --noconfirm --needed nerd-fonts-source-code-pro
yay -S --noconfirm --needed noto-fonts
yay -S --noconfirm --needed otf-font-awesome
yay -S --noconfirm --needed ttf-mac-fonts
yay -S --noconfirm --needed nerd-fonts-jetbrains-mono
yay -S --noconfirm --needed terminus-font
yay -S --noconfirm --needed ttf-font-awesome
yay -S --noconfirm --needed ttf-mac-fonts
yay -S --noconfirm --needed ttf-ubuntu-font-family
