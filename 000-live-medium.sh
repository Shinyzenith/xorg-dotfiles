#!/bin/bash
echo "0">swap
echo "">installdisk
echo "">rootpartition
echo "">bootpartition
echo "">swappartition

get_drive_info(){
	dialog --erase-on-exit --title "Filesystem" --yesno "Please manually setup your disk topology in another tty and come back to this prompt! Submit the yes option once you're done!" 10 30
	dialog --erase-on-exit --title "Filesystem" --yesno "Do you have a swap partition?" 10 20 && echo "1">swap
	dialog --erase-on-exit --title "Filesystem" --menu "Choose a disk to install Arch on" 10 50 5 $(lsblk |grep -i disk | awk '{print $1,"disk"}') 2>installdisk
	if [[ ! $(cat installdisk) ]];then
		echo "Please provide the install disk"
		exit 1
	fi
	dialog --erase-on-exit --title "Filesystem" --menu "Choose the root partition (/)" 10 50 5 $(lsblk | grep $(cat installdisk) | grep -i part | awk '{print $1," ",$4}' | sed 's/^[^a-zA-Z0-9]*\([a-z]*[0-9]\)/\1/g') 2>rootpartition
	dialog --erase-on-exit --title "Filesystem" --menu "Choose the boot partition (/boot)" 10 50 5 $(lsblk | grep $(cat installdisk) | grep -i part | grep -v $(cat rootpartition)| awk '{print $1," ",$4}' | sed 's/^[^a-zA-Z0-9]*\([a-z]*[0-9]\)/\1/g') 2>bootpartition
	if [[ $(cat swap) == 1 ]];then
		dialog --erase-on-exit --title "Filesystem" --menu "Choose the swap partition (/swap)" 10 50 5 $(lsblk | grep $(cat installdisk) | grep -i part| grep -v $(cat bootpartition) | grep -v $(cat rootpartition) | awk '{print $1," ",$4}' | sed 's/^[^a-zA-Z0-9]*\([a-z]*[0-9]\)/\1/g') 2>swappartition
		if [[ ! $(cat swappartition) ]];then
			echo "Please provide a label for the swap partition"
			exit 1
		fi
	fi
	if [[ ! $(cat bootpartition) || ! $(cat rootpartition) ]];then
		echo "Please provide all the installation partitions"
		exit 1
	fi
	dialog --defaultno --title "DON'T BE STUPID" --yesno "ARE YOU ABSOLUTELY CERTAIN REGARDING YOUR DISK CONFIGURATION?\n\nYOU CAN CHECK THE DISK CONFIGURATION BY RUNNING CAT ON THE PLAIN TEXT FILES IN THE CURRENT WORKING DIRECTORY"  15 60 || exit
}

format_drives(){
#	echo"mkfs.fat -F32 $(cat)"
}

get_drive_info
