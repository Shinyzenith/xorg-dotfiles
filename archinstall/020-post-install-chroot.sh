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
useradd -m -g users -G wheel,storage,power $usr
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
sudo rm -rf /020-post-install-chroot.sh
