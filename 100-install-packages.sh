#!/bin/bash

##################################################################################################################
# Basic needs for a functional setup (specific to my setup)
##################################################################################################################
git clone https://github.com/ohmyzsh/ohmyzsh.git ~/.oh-my-zsh
sudo pacman -S --noconfirm --needed xorg-xev
sudo pacman -S --noconfirm --needed xorg-xinit
sudo pacman -S --noconfirm --needed xorg-xprop
sudo pacman -S --noconfirm --needed xorg-server
sudo pacman -S --noconfirm --needed xorg-xinput
sudo pacman -S --noconfirm --needed xorg-xmodmap
sudo pacman -S --noconfirm --needed xorg-xsetroot
sudo pacman -S --noconfirm --needed xorg-xclipboard

sudo pacman -S --noconfirm --needed bat
sudo pacman -S --noconfirm --needed exa
sudo pacman -S --noconfirm --needed git
sudo pacman -S --noconfirm --needed zsh
sudo pacman -S --noconfirm --needed vlc
sudo pacman -S --noconfirm --needed mpv
sudo pacman -S --noconfirm --needed maim
sudo pacman -S --noconfirm --needed wget
sudo pacman -S --noconfirm --needed sxiv
sudo pacman -S --noconfirm --needed tmux
sudo pacman -S --noconfirm --needed tldr
sudo pacman -S --noconfirm --needed stow
sudo pacman -S --noconfirm --needed unzip
sudo pacman -S --noconfirm --needed p7zip
sudo pacman -S --noconfirm --needed bspwm
sudo pacman -S --noconfirm --needed expac
sudo pacman -S --noconfirm --needed qt5ct
sudo pacman -S --noconfirm --needed xclip
sudo pacman -S --noconfirm --needed sxhkd
sudo pacman -S --noconfirm --needed dunst
sudo pacman -S --noconfirm --needed zenity
sudo pacman -S --noconfirm --needed man-db
sudo pacman -S --noconfirm --needed wmname
sudo pacman -S --noconfirm --needed polkit
sudo pacman -S --noconfirm --needed ranger
sudo pacman -S --noconfirm --needed openssh
sudo pacman -S --noconfirm --needed ntfs-3g  # ntfs windows drive support
sudo pacman -S --noconfirm --needed xdotool
sudo pacman -S --noconfirm --needed bashtop
sudo pacman -S --noconfirm --needed zathura
sudo pacman -S --noconfirm --needed pcmanfm
sudo pacman -S --noconfirm --needed nitrogen
sudo pacman -S --noconfirm --needed ueberzug
sudo pacman -S --noconfirm --needed bbswitch
sudo pacman -S --noconfirm --needed numlockx
sudo pacman -S --noconfirm --needed reflector
sudo pacman -S --noconfirm --needed bitwarden
sudo pacman -S --noconfirm --needed xarchiver # for archive support in pcmanfm
sudo pacman -S --noconfirm --needed blueberry
sudo pacman -S --noconfirm --needed playerctl
sudo pacman -S --noconfirm --needed pulsemixer
sudo pacman -S --noconfirm --needed noto-fonts
sudo pacman -S --noconfirm --needed youtube-dl
sudo pacman -S --noconfirm --needed dosfstools
sudo pacman -S --noconfirm --needed intel-ucode
sudo pacman -S --noconfirm --needed kvantum-qt5
sudo pacman -S --noconfirm --needed lxappearance
sudo pacman -S --noconfirm --needed polkit-gnome
sudo pacman -S --noconfirm --needed brightnessctl
sudo pacman -S --noconfirm --needed speedtest-cli
sudo pacman -S --noconfirm --needed networkmanager
sudo pacman -S --noconfirm --needed discord-canary
sudo pacman -S --noconfirm --needed pulseaudio-alsa
sudo pacman -S --noconfirm --needed noto-fonts-emoji # enable emoji support
sudo pacman -S --noconfirm --needed otf-san-francisco
sudo pacman -S --noconfirm --needed zathura-pdf-mupdf
sudo pacman -S --noconfirm --needed archlinux-keyring
sudo pacman -S --noconfirm --needed papirus-icon-theme
sudo pacman -S --noconfirm --needed network-manager-applet

##################################################################################################################
# Asian font support
##################################################################################################################
sudo pacman -S --noconfirm --needed adobe-source-han-serif-cn-fonts 
sudo pacman -S --noconfirm --needed adobe-source-han-serif-jp-fonts 
sudo pacman -S --noconfirm --needed adobe-source-han-serif-kr-fonts 
sudo pacman -S --noconfirm --needed adobe-source-han-serif-otc-fonts 
sudo pacman -S --noconfirm --needed adobe-source-han-serif-tw-fonts

##################################################################################################################
# Nvidia packages
##################################################################################################################
sudo pacman -S --noconfirm --needed nvidia
sudo pacman -S --noconfirm --needed nvidia-utils
sudo pacman -S --noconfirm --needed nvidia-settings
#sudo pacman -S --noconfirm --needed xf86-video-nouveau

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

##################################################################################################################
# AUR packages
##################################################################################################################

##################################################################################################################
# Installing yay (AUR helper)
##################################################################################################################
git clone https://aur.archlinux.org/yay.git /tmp/yay-git-cloned
cd /tmp/yay-git-cloned/
makepkg -sfci --noconfirm --needed
rm -rf /tmp/yay-git-cloned

##################################################################################################################
# Installing AUR packages
##################################################################################################################
yay -S --noconfirm --needed alacritty-ligatures
yay -S --noconfirm --needed betterlockscreen
yay -S --noconfirm --needed brave-bin
yay -S --noconfirm --needed cava
yay -S --noconfirm --needed cursor-theme-macos-big-sur
yay -S --noconfirm --needed devour
yay -S --noconfirm --needed discord-ptb
yay -S --noconfirm --needed freetube-bin
yay -S --noconfirm --needed gotop
yay -S --noconfirm --needed moc-pulse
yay -S --noconfirm --needed nerd-fonts-jetbrains-mono
yay -S --noconfirm --needed nordic-darker-theme
yay -S --noconfirm --needed optimus-manager
yay -S --noconfirm --needed picom-ibhagwan-git
yay -S --noconfirm --needed polybar
yay -S --noconfirm --needed spotify
yay -S --noconfirm --needed timeshift-bin

echo "################################################################"
echo "################### Core Software Installed"
echo "################################################################"
