#!/bin/bash

##################################################################################################################
# Basic needs for a functional setup (specific to my setup)
##################################################################################################################
sudo pacman -S --noconfirm --needed xorg-xinit
sudo pacman -S --noconfirm --needed xorg-server
sudo pacman -S --noconfirm --needed xorg-xmodmap
sudo pacman -S --noconfirm --needed xorg-xsetroot

sudo pacman -S --noconfirm --needed exa
sudo pacman -S --noconfirm --needed git
sudo pacman -S --noconfirm --needed tlp # laptop specific; remove it if you are on a desktop
sudo pacman -S --noconfirm --needed zsh
sudo pacman -S --noconfirm --needed vlc
sudo pacman -S --noconfirm --needed maim
sudo pacman -S --noconfirm --needed sxiv
sudo pacman -S --noconfirm --needed stow
sudo pacman -S --noconfirm --needed bspwm
sudo pacman -S --noconfirm --needed sxhkd
sudo pacman -S --noconfirm --needed dunst
sudo pacman -S --noconfirm --needed wmname
sudo pacman -S --noconfirm --needed polkit
sudo pacman -S --noconfirm --needed openssh
sudo pacman -S --noconfirm --needed bashtop
sudo pacman -S --noconfirm --needed zathura
sudo pacman -S --noconfirm --needed pcmanfm
sudo pacman -S --noconfirm --needed nitrogen
sudo pacman -S --noconfirm --needed numlockx
sudo pacman -S --noconfirm --needed blueberry
sudo pacman -S --noconfirm --needed playerctl
sudo pacman -S --noconfirm --needed alacritty
sudo pacman -S --noconfirm --needed pulsemixer
sudo pacman -S --noconfirm --needed intel-ucode
sudo pacman -S --noconfirm --needed lxappearance
sudo pacman -S --noconfirm --needed polkit-gnome
sudo pacman -S --noconfirm --needed brightnessctl
sudo pacman -S --noconfirm --needed networkmanager
sudo pacman -S --noconfirm --needed zathura-pdf-mupdf
sudo pacman -S --noconfirm --needed optimus-manager-qt
sudo pacman -S --noconfirm --needed xfce4-power-manager
sudo pacman -S --noconfirm --needed network-manager-applet

##################################################################################################################
# Development tools
##################################################################################################################
sudo pacman -S --noconfirm --needed npm
sudo pacman -S --noconfirm --needed docker
sudo pacman -S --noconfirm --needed neovim
sudo pacman -S --noconfirm --needed nodejs
sudo pacman -S --noconfirm --needed python3
sudo pacman -S --noconfirm --needed ripgrep
sudo pacman -S --noconfirm --needed python-pip

##################################################################################################################
# Extra programs
##################################################################################################################
sudo pacman -S --noconfirm --needed neofetch
sudo pacman -S --noconfirm --needed zathura-ps
sudo pacman -S --noconfirm --needed virtualbox
sudo pacman -S --noconfirm --needed obs-studio
sudo pacman -S --noconfirm --needed imagemagick
sudo pacman -S --noconfirm --needed otf-font-awesome
sudo pacman -S --noconfirm --needed ttf-font-awesome

##################################################################################################################
# Printer support (uncomment if needed)
##################################################################################################################
#sudo pacman -S --noconfirm --needed cups
#sudo pacman -S --noconfirm --needed cups-pdf
#sudo pacman -S --noconfirm --needed gutenprint
#sudo systemctl enable cups
#sudo systemctl start cups

sudo systemctl start sshd
sudo systemctl enable sshd
sudo systemctl start docker
sudo systemctl enable docker
sudo systemctl start tlp.service
sudo systemctl enable tlp.service

echo "################################################################"
echo "################### Core Software Installed"
echo "################################################################"
