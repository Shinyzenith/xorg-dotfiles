#!/bin/bash
echo "Provide the username of the user account"
read username
useradd -m -g users -G wheel,storage,power $username
sudo sed -i 's/^#%wheel ALL=(ALL) NOPASSWD: ALL/%wheel ALL=(ALL) NOPASSWD: ALL/g' /etc/sudoers
git clone https://github.com/AakashSharma7269/dotfiles /home/$username/.dotfiles
passwd $username
