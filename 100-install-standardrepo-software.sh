#!/bin/bash

##################################################################################################################
# Basic needs for a functional setup (specific to my setup)
##################################################################################################################
sudo pacman -S --noconfirm --needed xorg-xinit
sudo pacman -S --noconfirm --needed xorg-xprop
sudo pacman -S --noconfirm --needed xorg-server
sudo pacman -S --noconfirm --needed xorg-xmodmap
sudo pacman -S --noconfirm --needed xorg-xsetroot
sudo pacman -S --noconfirm --needed xorg-xclipboard

sudo pacman -S --noconfirm --needed exa
sudo pacman -S --noconfirm --needed git
sudo pacman -S --noconfirm --needed zsh
sudo pacman -S --noconfirm --needed vlc
sudo pacman -S --noconfirm --needed maim
sudo pacman -S --noconfirm --needed sxiv
sudo pacman -S --noconfirm --needed stow
sudo pacman -S --noconfirm --needed bspwm
sudo pacman -S --noconfirm --needed sxhkd
sudo pacman -S --noconfirm --needed dunst
sudo pacman -S --noconfirm --needed zenity
sudo pacman -S --noconfirm --needed wmname
sudo pacman -S --noconfirm --needed polkit
sudo pacman -S --noconfirm --needed ranger
sudo pacman -S --noconfirm --needed openssh
sudo pacman -S --noconfirm --needed bashtop
sudo pacman -S --noconfirm --needed zathura
sudo pacman -S --noconfirm --needed pcmanfm
sudo pacman -S --noconfirm --needed nitrogen
sudo pacman -S --noconfirm --needed ueberzug
sudo pacman -S --noconfirm --needed bbswitch
sudo pacman -S --noconfirm --needed numlockx
sudo pacman -S --noconfirm --needed blueberry
sudo pacman -S --noconfirm --needed playerctl
sudo pacman -S --noconfirm --needed pulsemixer
sudo pacman -S --noconfirm --needed intel-ucode
sudo pacman -S --noconfirm --needed lxappearance
sudo pacman -S --noconfirm --needed polkit-gnome
sudo pacman -S --noconfirm --needed brightnessctl
sudo pacman -S --noconfirm --needed networkmanager
sudo pacman -S --noconfirm --needed zathura-pdf-mupdf
sudo pacman -S --noconfirm --needed archlinux-keyring
sudo pacman -S --noconfirm --needed xfce4-power-manager
sudo pacman -S --noconfirm --needed network-manager-applet

##################################################################################################################
# Nvidia packages
##################################################################################################################
sudo pacman -S --noconfirm --needed nvidia
sudo pacman -S --noconfirm --needed nvidia
sudo pacman -S --noconfirm --needed nvidia-utils
sudo pacman -S --noconfirm --needed nvidia-settings
sudo pacman -S --noconfirm --needed xf86-video-nouveau

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

##################################################################################################################
# Printer support (uncomment if needed)
##################################################################################################################
#sudo pacman -S --noconfirm --needed cups
#sudo pacman -S --noconfirm --needed cups-pdf
#sudo pacman -S --noconfirm --needed gutenprint
#sudo systemctl enable cups
#sudo systemctl start cups

sudo systemctl enable sshd
sudo systemctl enable docker
sudo systemctl enable NetworkManager
sudo systemctl enable systemd-timesyncd

sudo systemctl start sshd
sudo systemctl start docker
sudo systemctl start NetworkManager
sudo systemctl start systemd-timesyncd

echo "################################################################"
echo "################### Core Software Installed"
echo "################################################################"
