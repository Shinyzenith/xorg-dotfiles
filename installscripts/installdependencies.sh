sudo pacman -S intel-ucode python3 python-pip nodejs npm bspwm sxhkd zsh xorg lxappearance xorg-xinit maim sxiv blueberry neovim bashtop pulsemixer pcmanfm zathura zathura-pdf-mupdf zathura-ps otf-font-awesome ttf-font-awesome obs-studio stow alacritty exa nitrogen brightnessctl pcmanfm git xorg-xmodmap xorg-xsetroot networkmanager xfce4-notifyd xfce4-power-manager polkit polkit-gnome neofetch numlockx
yay -S lf polybar brave-bin paper-icon-theme spotify gotop cherry-font-git ttf-mac-fonts nerd-fonts-jetbrains-mono discord-canary nordic-darker-theme picom-ibhagwan-git freetube-bin ttf-font-logos otf-font-awesome-5-free bat adobe-source-han-sans-cn-fonts adobe-source-han-sans-jp-fonts adobe-source-han-sans-kr-fonts adobe-source-sans-fonts awesome-terminal-fonts cherry-font-git gsfonts nerd-fonts-jetbrains-mono nerd-fonts-source-code-pro noto-fonts otf-font-awesome terminus-font ttf-font-awesome ttf-mac-fonts ttf-ubuntu-font-family xorg-mkfontscale
sudo python3 -m pip install neovim
sudo npm install neovim --global
sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
echo "Installed oh my zsh"
sh -c 'curl -fLo "${XDG_DATA_HOME:-$HOME/.local/share}"/nvim/site/autoload/plug.vim --create-dirs \
       https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
echo "Installed vim plug"
