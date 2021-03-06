#!/bin/bash
sudo pacman -Syy
sudo pacman -S --noconfirm --needed dialog
pass1=$(dialog --no-cancel --passwordbox "Enter a root password." 10 60 3>&1 1>&2 2>&3 3>&1)
pass2=$(dialog --no-cancel --passwordbox "Retype password." 10 60 3>&1 1>&2 2>&3 3>&1)
while true; do
	[[ "$pass1" != "" && "$pass1" == "$pass2" ]] && break
	pass1=$(dialog --no-cancel --passwordbox "Passwords do not match or are not present.\n\nEnter password again." 10 60 3>&1 1>&2 2>&3 3>&1)
	pass2=$(dialog --no-cancel --passwordbox "Retype password." 10 60 3>&1 1>&2 2>&3 3>&1)
done
echo "root:$pass1" | chpasswd

usr=$(dialog --no-cancel --inputbox "Enter the username of normal user account." 10 60 3>&1 1>&2 2>&3 3>&1)
useradd -m -s $(which zsh) -g users -G wheel,storage,power $usr
pass1=$(dialog --no-cancel --passwordbox "Enter a user password." 10 60 3>&1 1>&2 2>&3 3>&1)
pass2=$(dialog --no-cancel --passwordbox "Retype password." 10 60 3>&1 1>&2 2>&3 3>&1)
while true; do
	[[ "$pass1" != "" && "$pass1" == "$pass2" ]] && break
	pass1=$(dialog --no-cancel --passwordbox "Passwords do not match or are not present.\n\nEnter password again." 10 60 3>&1 1>&2 2>&3 3>&1)
	pass2=$(dialog --no-cancel --passwordbox "Retype password." 10 60 3>&1 1>&2 2>&3 3>&1)
done
echo "$usr:$pass1" | chpasswd

git clone https://github.com/shinyzenith/dotfiles /home/$usr/.dotfiles
chown -R $usr /home/$usr/.dotfiles
sudo grub-mkconfig -o /boot/grub/grub.cfg
sudo pacman -Rns dialog
sudo rm /020-post-install-chroot.sh
