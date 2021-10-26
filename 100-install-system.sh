#!/bin/bash
##################################################################################################################
# Installing aura (package manager)
##################################################################################################################
sudo pacman -S --noconfirm --needed git 
git clone https://aur.archlinux.org/aura-bin.git /tmp/aura-git-cloned
cd /tmp/aura-git-cloned/
makepkg -sfci --noconfirm --needed

##################################################################################################################
# Basic needs for a functional setup (specific to my setup)
##################################################################################################################
sudo aura -S --noconfirm --needed xorg-xev
sudo aura -S --noconfirm --needed xorg-xinit
sudo aura -S --noconfirm --needed xorg-xprop
sudo aura -S --noconfirm --needed xorg-xkill
sudo aura -S --noconfirm --needed xorg-server
sudo aura -S --noconfirm --needed xorg-xinput
sudo aura -S --noconfirm --needed xorg-xmodmap
sudo aura -S --noconfirm --needed xorg-xsetroot
sudo aura -S --noconfirm --needed xorg-xclipboard

sudo aura -S --noconfirm --needed bat
sudo aura -S --noconfirm --needed exa
sudo aura -S --noconfirm --needed git
sudo aura -S --noconfirm --needed zsh
sudo aura -S --noconfirm --needed vlc
sudo aura -S --noconfirm --needed mpv
sudo aura -S --noconfirm --needed maim
sudo aura -S --noconfirm --needed meld
sudo aura -S --noconfirm --needed btop
sudo aura -S --noconfirm --needed wget
sudo aura -S --noconfirm --needed sxiv
sudo aura -S --noconfirm --needed tmux
sudo aura -S --noconfirm --needed tldr
sudo aura -S --noconfirm --needed stow
sudo aura -S --noconfirm --needed dkms
sudo aura -S --noconfirm --needed gvfs
sudo aura -S --noconfirm --needed unzip
sudo aura -S --noconfirm --needed p7zip
sudo aura -S --noconfirm --needed expac
sudo aura -S --noconfirm --needed qt5ct
sudo aura -S --noconfirm --needed xclip
sudo aura -S --noconfirm --needed sxhkd
sudo aura -S --noconfirm --needed bluez 
sudo aura -S --noconfirm --needed dunst
sudo aura -S --noconfirm --needed zenity
sudo aura -S --noconfirm --needed man-db
sudo aura -S --noconfirm --needed wmname
sudo aura -S --noconfirm --needed polkit
sudo aura -S --noconfirm --needed ranger
sudo aura -S --noconfirm --needed openssh
sudo aura -S --noconfirm --needed ntfs-3g
sudo aura -S --noconfirm --needed mlocate
sudo aura -S --noconfirm --needed xdotool
sudo aura -S --noconfirm --needed zathura
sudo aura -S --noconfirm --needed pcmanfm
sudo aura -S --noconfirm --needed nitrogen
sudo aura -S --noconfirm --needed ueberzug
sudo aura -S --noconfirm --needed polybar
sudo aura -S --noconfirm --needed bbswitch
sudo aura -S --noconfirm --needed numlockx
sudo aura -S --noconfirm --needed reflector
sudo aura -S --noconfirm --needed bitwarden
sudo aura -S --noconfirm --needed xarchiver
sudo aura -S --noconfirm --needed blueberry
sudo aura -S --noconfirm --needed playerctl
sudo aura -S --noconfirm --needed noto-fonts
sudo aura -S --noconfirm --needed volumeicon
sudo aura -S --noconfirm --needed dosfstools
sudo aura -S --noconfirm --needed pulsemixer
sudo aura -S --noconfirm --needed bluez-utils
sudo aura -S --noconfirm --needed intel-ucode
sudo aura -S --noconfirm --needed kvantum-qt5
sudo aura -S --noconfirm --needed polkit-gnome
sudo aura -S --noconfirm --needed brightnessctl
sudo aura -S --noconfirm --needed speedtest-cli
sudo aura -S --noconfirm --needed discord-canary
sudo aura -S --noconfirm --needed pulseaudio-alsa
sudo aura -S --noconfirm --needed noto-fonts-emoji
sudo aura -S --noconfirm --needed zathura-pdf-mupdf
sudo aura -S --noconfirm --needed archlinux-keyring
sudo aura -S --noconfirm --needed papirus-icon-theme
sudo aura -S --noconfirm --needed picom-jonaburg-git
sudo aura -S --noconfirm --needed xelph-wallpapers-git
sudo aura -S --noconfirm --needed network-manager-applet

##################################################################################################################
# Asian font support
##################################################################################################################
sudo aura -S --noconfirm --needed adobe-source-han-serif-cn-fonts 
sudo aura -S --noconfirm --needed adobe-source-han-serif-jp-fonts 
sudo aura -S --noconfirm --needed adobe-source-han-serif-kr-fonts 
sudo aura -S --noconfirm --needed adobe-source-han-serif-otc-fonts 
sudo aura -S --noconfirm --needed adobe-source-han-serif-tw-fonts

##################################################################################################################
# Drivers 
##################################################################################################################
sudo aura -S --noconfirm --needed bbswitch
sudo aura -S --noconfirm --needed intel-ucode
sudo aura -S --noconfirm --needed lib32-mesa 
sudo aura -S --noconfirm --needed lib32-nvidia-utils 
sudo aura -S --noconfirm --needed lib32-vulkan-icd-loader
sudo aura -S --noconfirm --needed lib32-vulkan-icd-loader
sudo aura -S --noconfirm --needed lib32-vulkan-intel 
sudo aura -S --noconfirm --needed mesa
sudo aura -S --noconfirm --needed nvidia
sudo aura -S --noconfirm --needed nvidia-prime
sudo aura -S --noconfirm --needed nvidia-settings
sudo aura -S --noconfirm --needed nvidia-utils
sudo aura -S --noconfirm --needed optimus-manager
sudo aura -S --noconfirm --needed optimus-manager-qt
sudo aura -S --noconfirm --needed vulkan-icd-loader 
sudo aura -S --noconfirm --needed vulkan-icd-loader 
sudo aura -S --noconfirm --needed vulkan-intel 
sudo aura -S --noconfirm --needed xf86-video-intel

##################################################################################################################
# Development tools
##################################################################################################################
sudo aura -S --noconfirm --needed npm
#sudo aura -S --noconfirm --needed docker
sudo aura -S --noconfirm --needed neovim
sudo aura -S --noconfirm --needed nodejs
sudo aura -S --noconfirm --needed python3
sudo aura -S --noconfirm --needed ripgrep
sudo aura -S --noconfirm --needed python-pip

##################################################################################################################
# Extra programs
##################################################################################################################
sudo aura -S --noconfirm --needed neofetch
sudo aura -S --noconfirm --needed zathura-ps
sudo aura -S --noconfirm --needed obs-studio
sudo aura -S --noconfirm --needed imagemagick

sudo systemctl enable sshd
sudo systemctl enable systemd-timesyncd

sudo systemctl start sshd
sudo systemctl start systemd-timesyncd


sudo aura -S --noconfirm --needed betterlockscreen-git
sudo aura -S --noconfirm --needed cursor-theme-macos-big-sur
sudo aura -S --noconfirm --needed devour
sudo aura -S --noconfirm --needed gotop-bin
sudo aura -S --noconfirm --needed moc-pulse
sudo aura -S --noconfirm --needed nerd-fonts-jetbrains-mono
sudo aura -S --noconfirm --needed nordic-darker-theme
sudo aura -S --noconfirm --needed otf-san-francisco
sudo aura -S --noconfirm --needed zsh-autosuggestions
sudo aura -S --noconfirm --needed zsh-syntax-highlighting
sudo aura -Aca --noconfirm --needed brave-bin
sudo aura -Aca --noconfirm --needed oh-my-zsh-git
sudo aura -Aca --noconfirm --needed optimus-manager
sudo aura -Aca --noconfirm --needed youtube-dlp-bin
#sudo aura -Aca --noconfirm --needed spotify
#sudo aura -Aca --noconfirm --needed timeshift-bin
#sudo aura -Aca --noconfirm --needed tmux-plugin-manager
echo "################################################################"
echo "################### Core Software Installed"
echo "################################################################"

##################################################################################################################
# Remove all current configs to avoid conflict, will probably make this dynamic later on
##################################################################################################################
rm -rf ~/.bin ~/VirtualBox VMs ~/.config/btop ~/.config/ranger ~/.moc ~/.config/dunst/ ~/.zprofile ~/.xinitrc ~/.config/bspwm ~/.config/nvim ~/.config/bspwm/polybar ~/.config/zathura ~/.gitconfig ~/.config/gtk-3.0 ~/.gtkrc-2.0 ~/.tmux.conf ~/.zshrc ~/.zshrc-personal

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

sudo python3 -m pip install neovim
sudo npm install neovim --global
mkdir -p ~/.bin
mkdir -p ~/.config/nitrogen
mkdir -p ~/.vim/undodir
mkdir -p ~/Pictures/screenshots
mkdir -p ~/Videos/recordings
sh -c 'curl -fLo "${XDG_DATA_HOME:-$HOME/.local/share}"/nvim/site/autoload/plug.vim --create-dirs \
       https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
sudo mkdir -p /usr/share/icons/default
sudo touch /usr/share/icons/default/index.theme
sudo chown $USER /usr/share/icons/default/index.theme
sudo echo "[Icon Theme]" > /usr/share/icons/default/index.theme
sudo echo "Inherits=macOSBigSur" >> /usr/share/icons/default/index.theme
sudo chown root /usr/share/icons/default/index.theme
sudo mkdir -p ~/.config/nitrogen/
sudo cp ~/.dotfiles/bg-saved.cfg ~/.config/nitrogen/bg-saved.cfg
mkdir ~/.dwm
cp ~/.dotfiles/dwmautostart ~/.dwm/autostart_personal.sh
sudo chmod 755 ~/.dwm/autostart_personal.sh
echo "################################################################"
echo "################### Config files placed in the right directories"
echo "################################################################"
