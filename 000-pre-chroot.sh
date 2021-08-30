#!/bin/bash

########################################################################################################
# Run the script at your own discretion!
########################################################################################################

instanciate_config_files(){
	echo "0">swap
	echo "">installdisk
	echo "">rootpartition
	echo "">bootpartition
	echo "">swappartition
	echo "">extrapackages
}

remove_config_files(){
	rm -rf swap
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
	arch-chroot /mnt
}

main(){
	echo "Please load some modules to start the install process"
}
main
