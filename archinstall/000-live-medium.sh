#!/bin/bash
########################################################################################################
# Run the script at your own discretion!
########################################################################################################
sudo pacman -S --noconfirm --needed dialog
instanciate_config_files(){
	echo "0">swap
	echo "">locale
	echo "">timezone
	echo "">hostname
	echo "">temphosts
	echo "">locale.conf
	echo "">useraccount
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
	rm -rf locale.conf
	rm -rf useraccount
	rm -rf installdisk
	rm -rf rootpartition
	rm -rf bootpartition
	rm -rf swappartition
	rm -rf extrapackages
}

config(){
	dialog --erase-on-exit --title "Filesystem" --yesno "Please manually setup your disk topology in another tty and come back to this prompt! Submit the yes option once you're done!" 10 30 || exit
	dialog --erase-on-exit --title "Filesystem" --yesno "Do you have a swap partition?" 10 20 && echo "1">swap
	dialog --no-cancel --erase-on-exit --title "Filesystem" --menu "Choose a disk to install Arch on" 10 50 5 $(lsblk |grep -i disk | awk '{print $1,"disk"}') 2>installdisk
	dialog --no-cancel --erase-on-exit --title "Filesystem" --menu "Choose the root partition (/)" 10 50 5 $(lsblk | grep $(cat installdisk) | grep -i part | awk '{print $1," ",$4}' | sed 's/^[^a-zA-Z0-9]*\([a-z]*[0-9]\)/\1/g') 2>rootpartition
	dialog --no-cancel --erase-on-exit --title "Filesystem" --menu "Choose the boot partition (/boot)" 10 50 5 $(lsblk | grep $(cat installdisk) | grep -i part | grep -v $(cat rootpartition)| awk '{print $1," ",$4}' | sed 's/^[^a-zA-Z0-9]*\([a-z]*[0-9]\)/\1/g') 2>bootpartition
	if [[ $(cat swap) == 1 ]];then
		dialog --no-cancel --erase-on-exit --title "Filesystem" --menu "Choose the swap partition (/swap)" 10 50 5 $(lsblk | grep $(cat installdisk) | grep -i part| grep -v $(cat bootpartition) | grep -v $(cat rootpartition) | awk '{print $1," ",$4}' | sed 's/^[^a-zA-Z0-9]*\([a-z]*[0-9]\)/\1/g') 2>swappartition
	fi

	dialog --no-cancel --erase-on-exit --inputbox "Please specify your timezone, you can find it over at /usr/share/zoneinfo/. EG: Asia/Kolkata" 20 60 2>timezone
	if [[ ! $(cat timezone) ]];then
		echo "Please provide a valid timezone"
		exit 1
	fi
	if [[ ! $(file "/usr/share/zoneinfo/"$(cat timezone)| grep "No such file or directory") ]];then
		echo "Got zoneinfo"
	else
		echo "Provided timezone binary doesn't exist. Please try again"
		exit 1
	fi

	dialog --no-cancel --erase-on-exit --inputbox "Please specify your locale file, you can find all possible locales by running cat /etc/locale.gen eg: en_US.UTF-8 UTF-8 for EnglishUS" 20 60 2>locale
	if [[ ! $(cat locale) ]];then
		echo "Please provide a valid locale file"
		exit 1
	fi
	if [[ ! $(cat /etc/locale.gen| grep "$(cat locale)") ]];then
		echo "Provided locale file doesn't exist. Please try again"
		exit 1
	fi

	dialog --no-cancel --erase-on-exit --inputbox "Specify the contents of /etc/locale.conf eg: en_US.UTF-8 for english" 20 60 2>locale.conf
	if [[ ! $(cat locale.conf) ]];then
		exit 1
	fi

	dialog --erase-on-exit --no-cancel --inputbox "Enter a name for your computer." 10 60 2>hostname
	if [[ ! $(cat hostname) ]];then
		echo "ArchLinux" > hostname
	fi
	dialog --defaultno --title "DON'T BE STUPID" --yesno "ARE YOU ABSOLUTELY CERTAIN REGARDING YOUR DISK CONFIGURATION?\n\nYOU CAN CHECK THE DISK CONFIGURATION BY RUNNING CAT ON THE PLAIN TEXT FILES IN THE CURRENT WORKING DIRECTORY"  15 60 || exit
}

base_install(){
	if [[ $(cat swap) == 1 ]];then
		mkswap "/dev/"$(cat swappartition)
		swapon "/dev/"$(cat swappartition)
	fi
	mv 013-live-medium-pacman /etc/pacman.conf
	reflector -f 30 -l 30 --number 10 --verbose --save /etc/pacman.d/mirrorlist
	pacman -Sy
	mkfs.ext4 "/dev/"$(cat rootpartition)
	mkfs.fat -F32 "/dev/"$(cat bootpartition)
	mount "/dev/"$(cat rootpartition) /mnt;mkdir -p /mnt/boot
	mount "/dev/"$(cat bootpartition) /mnt/boot
	dialog --erase-on-exit --inputbox "xelph-ranger-devicons-git xelph-grub-config-git xelph-config-dwm-git xdg-user-dirs base linux linux-firmware linux-headers base-devel efibootmgr grub and networkmanager will be installed. Specify any extra packages you might want here separated by space." 20 60 2>extrapackages
	pacstrap /mnt xelph-ranger-devicons-git xelph-config-dwm-git xelph-grub-config-git xdg-user-dirs base linux linux-firmware linux-headers base-devel efibootmgr grub networkmanager $(cat extrapackages)
	genfstab -U /mnt >> /mnt/etc/fstab
}

post_base_install(){
	arch-chroot /mnt systemctl enable NetworkManager
	arch-chroot /mnt hwclock --systohc
	arch-chroot /mnt timedatectl set-ntp true
	arch-chroot /mnt reflector -f 30 -l 30 --number 10 --verbose --save /etc/pacman.d/mirrorlist
	arch-chroot /mnt pacman -Syy
	echo $(cat locale) >> /mnt/etc/locale.gen
	arch-chroot /mnt ln -sf "/usr/share/zoneinfo/"$(cat timezone) /etc/localtime
	arch-chroot /mnt locale-gen
	echo "LANG="$(cat locale.conf) >> /mnt/etc/locale.conf
	mv hostname /mnt/etc/hostname
	arch-chroot /mnt grub-install --target=x86_64-efi --efi-directory=/boot --bootloader-id=GRUB
	mv 012-live-medium-grub /mnt/etc/default/grub
	arch-chroot /mnt grub-mkconfig -o /boot/grub/grub.cfg
	cp 010-live-medium-etc-hosts temphosts
	echo "127.0.1.1	$(cat /mnt/etc/hostname)" >> temphosts
	mv temphosts /mnt/etc/hosts
	mv 014-live-touchpad-ttc.conf /mnt/etc/X11/xorg.conf.d/02-touchpad-ttc.conf
	mv 020-post-install-chroot.sh /mnt/020-post-install.sh
	mv 011-live-medium-etc-sudoers /mnt/etc/sudoers
	mv 013-live-medium-pacman /mnt/etc/pacman.conf
	echo "################################################################"
	echo "################### Base system install complete."
	echo "################################################################"
	arch-chroot /mnt
}

main(){
	instanciate_config_files
	config
	base_install
	post_base_install
	remove_config_files
}
main
