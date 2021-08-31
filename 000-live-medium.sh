#!/bin/bash

########################################################################################################
# Run the script at your own discretion!
########################################################################################################
dependencies(){
	sudo pacman -Syy
	sudo pacman -S dialog
}

instanciate_config_files(){
	echo "0">swap
	echo "">locale
	echo "">timezone
	echo "">hostname
	echo "">temphosts
	echo "">installdisk
	echo "">rootpartition
	echo "">bootpartition
	echo "">swappartition
	echo "">extrapackages
}

remove_config_files(){
	rm -rf swap
	rm -rf locale
	rm -rf timezone
	rm -rf hostname
	rm -rf temphosts
	rm -rf installdisk
	rm -rf rootpartition
	rm -rf bootpartition
	rm -rf swappartition
	rm -rf extrapackages
}

get_drive_info(){
	dialog --erase-on-exit --title "Filesystem" --yesno "Please manually setup your disk topology in another tty and come back to this prompt! Submit the yes option once you're done!" 10 30 || exit
	dialog --erase-on-exit --title "Filesystem" --yesno "Do you have a swap partition?" 10 20 && echo "1">swap
	dialog --no-cancel --erase-on-exit --title "Filesystem" --menu "Choose a disk to install Arch on" 10 50 5 $(lsblk |grep -i disk | awk '{print $1,"disk"}') 2>installdisk
	dialog --no-cancel --erase-on-exit --title "Filesystem" --menu "Choose the root partition (/)" 10 50 5 $(lsblk | grep $(cat installdisk) | grep -i part | awk '{print $1," ",$4}' | sed 's/^[^a-zA-Z0-9]*\([a-z]*[0-9]\)/\1/g') 2>rootpartition
	dialog --no-cancel --erase-on-exit --title "Filesystem" --menu "Choose the boot partition (/boot)" 10 50 5 $(lsblk | grep $(cat installdisk) | grep -i part | grep -v $(cat rootpartition)| awk '{print $1," ",$4}' | sed 's/^[^a-zA-Z0-9]*\([a-z]*[0-9]\)/\1/g') 2>bootpartition
	if [[ $(cat swap) == 1 ]];then
		dialog --no-cancel --erase-on-exit --title "Filesystem" --menu "Choose the swap partition (/swap)" 10 50 5 $(lsblk | grep $(cat installdisk) | grep -i part| grep -v $(cat bootpartition) | grep -v $(cat rootpartition) | awk '{print $1," ",$4}' | sed 's/^[^a-zA-Z0-9]*\([a-z]*[0-9]\)/\1/g') 2>swappartition
	fi
	dialog --defaultno --title "DON'T BE STUPID" --yesno "ARE YOU ABSOLUTELY CERTAIN REGARDING YOUR DISK CONFIGURATION?\n\nYOU CAN CHECK THE DISK CONFIGURATION BY RUNNING CAT ON THE PLAIN TEXT FILES IN THE CURRENT WORKING DIRECTORY"  15 60 || exit
}

drive_setup(){
	mkswap "/dev/"$(cat swappartition)
	mkfs.ext4 "/dev/"$(cat rootpartition)
	mkfs.fat -F32 "/dev/"$(cat bootpartition)
	mount "/dev/"$(cat rootpartition) /mnt;mkdir -p /mnt/boot
	mount "/dev/"$(cat bootpartition) /mnt/boot
	swapon "/dev/"$(cat swappartition)
}

base_system_install(){
	dialog --erase-on-exit --inputbox "base linux linux-firmware linux-headers base-devel vim efibootmgr grub openssh networkmanager xf86-video-intel git and mesa will be installed. Specify any extra packages you might want here separated by space." 20 60 2>extrapackages
	pacstrap /mnt base linux linux-firmware linux-headers base-devel vim efibootmgr grub openssh networkmanager xf86-video-intel git mesa $(cat extrapackages)
	genfstab -U /mnt >> /mnt/etc/fstab
}

post_base_install(){
	arch-chroot /mnt sed -i 's/^#%wheel ALL=(ALL) NOPASSWD: ALL/%wheel ALL=(ALL) NOPASSWD: ALL/g' /etc/sudoers
	arch-chroot /mnt systemctl enable sshd
	arch-chroot /mnt systemctl enable NetworkManager
	arch-chroot /mnt systemctl enable systemd-timesyncd
	arch-chroot /mnt hwclock --systohc

	dialog --no-cancel --erase-on-exit --inputbox "Please specify your timezone, you can find it over at /usr/share/zoneinfo/. EG: Asia/Kolkata" 20 60 2>timezone
	if [[ ! $(cat timezone) ]];then
		echo "Please provide a valid timezone"
		exit 1
	fi
	if [[ ! $(file "/usr/share/zoneinfo/"$(cat timezone)| grep "No such file or directory") ]];then
		arch-chroot /mnt ln -sf "/usr/share/zoneinfo/"$(cat timezone) /etc/localtime
	else
		echo "Provided timezone binary doesn't exist. Please try again"
		exit 1
	fi
	arch-chroot /mnt timedatectl set-timezone $(cat timezone)
	arch-chroot /mnt timedatectl set-ntp true
	dialog --no-cancel --erase-on-exit --inputbox "Please specify your locale file, you can find all possible locales by running cat /etc/locale.gen eg: en_US.UTF-8 UTF-8 for EnglishUS" 20 60 2>locale
	if [[ ! $(cat locale) ]];then
		echo "Please provide a valid locale file"
		exit 1
	fi
	if [[ ! $(cat /mnt/etc/locale.gen| grep "$(cat locale)") ]];then
		echo "Provided locale file doesn't exist. Please try again"
		exit 1
	else
		echo $(cat locale) >> /mnt/etc/locale.gen
	fi
	arch-chroot /mnt locale-gen

	dialog --no-cancel --erase-on-exit --inputbox "Specify the contents of /etc/locale.conf eg: en_US.UTF-8 for english" 20 60 2>locale
	if [[ ! $(cat locale) ]];then
		exit 1
	fi
	echo "LANG="$(cat locale) >> /mnt/etc/locale.conf

	dialog --erase-on-exit --no-cancel --inputbox "Enter a name for your computer." 10 60 2> hostname
	mv comp /mnt/etc/hostname

	pass1=$(dialog --erase-on-exit --no-cancel --passwordbox "Enter a root password." 10 60 3>&1 1>&2 2>&3 3>&1)
	pass2=$(dialog --erase-on-exit --no-cancel --passwordbox "Retype password." 10 60 3>&1 1>&2 2>&3 3>&1)
	while true; do
		[[ "$pass1" != "" && "$pass1" == "$pass2" ]] && break
		pass1=$(dialog --no-cancel --passwordbox "Passwords do not match or are not present.\n\nEnter password again." 10 60 3>&1 1>&2 2>&3 3>&1)
		pass2=$(dialog --no-cancel --passwordbox "Retype password." 10 60 3>&1 1>&2 2>&3 3>&1)
	done
	export pass="$pass1"
	arch-chroot /mnt echo "root:$pass" | chpasswd
	arch-chroot /mnt grub-install --target=x86_64-efi --efi-directory=/boot --bootloader-id=GRUB
	arch-chroot /mnt grub-mkconfig -o /boot/grub/grub.cfg

	user=$(dialog --erase-on-exit --no-cancel --inputbox "Enter the username of a normal user" 10 60 3>&1 1>&2 2>&3 3>&1)
	arch-chroot /mnt useradd -m -g users -G wheel,storage,power $user
	pass1=$(dialog --erase-on-exit --no-cancel --passwordbox "Enter the password for $user account." 10 60 3>&1 1>&2 2>&3 3>&1)
	pass2=$(dialog --erase-on-exit --no-cancel --passwordbox "Retype password." 10 60 3>&1 1>&2 2>&3 3>&1)
	while true; do
		[[ "$pass1" != "" && "$pass1" == "$pass2" ]] && break
		pass1=$(dialog --no-cancel --passwordbox "Passwords do not match or are not present.\n\nEnter password again." 10 60 3>&1 1>&2 2>&3 3>&1)
		pass2=$(dialog --no-cancel --passwordbox "Retype password." 10 60 3>&1 1>&2 2>&3 3>&1)
	done
	export pass="$pass1"
	arch-chroot /mnt echo "$user:$pass" | chpasswd
	cp 010-live-medium-etc-hosts temphosts
	echo "127.0.1.1	$(cat /mnt/etc/hostname)" >> temphosts
	mv temphosts >> /mnt/etc/hosts
}


main(){
	echo "Please load some modules to start the install process"
	#dependencies
	#instanciate_config_files
	#get_drive_info
	#drive_setup
	#base_system_install
	#post_base_install
	#remove_config_files
}
main
