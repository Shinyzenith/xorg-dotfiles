#!/bin/bash
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
dots=$(dialog --no-cancel --inputbox "Do you want my dotfiles in /home/$usr/.dotfiles?\nLeave the field empty to skip it, type yes if you want it." 10 60 3>&1 1>&2 2>&3 3>&1)
if [[ $dots == "yes" ]]; then
	git clone https://github.com/AakashSharma7269/dotfiles /home/$usr/.dotfiles
fi
sudo systemctl enable iwd
sudo grub-mkconfig -o /boot/grub/grub.cfg # you need this for grub to detect windows for dual booting after ntfs-3g installation. Remove the package ntfs-3g if you don't plan to dual boot.
# if dual booting problems persist then read https://bbs.archlinux.org/viewtopic.php?id=240117
echo "setup your keyboard manually."
# https://makandracards.com/makandra-orga/37763-gpg-extract-private-key-and-import-on-different-machine  use this guide to backup your gpg keys before the install
