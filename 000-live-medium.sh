#!/bin/bash
disks=( $(lsblk |grep -i disk | awk '{print $1}') )

whiptail --title "Choose a partition to install Arch Linux on" --menu "Choose" 16 78 10 $(lsblk |grep -i disk | awk '{print $1}')

