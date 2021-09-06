#!/bin/bash

##################################################################################################################
# QEMU and virt-manager setup (https://www.youtube.com/watch?v=AAfFewePE7c QEMU guide)
##################################################################################################################
sudo pacman -S --noconfirm --needed qemu
sudo pacman -S --noconfirm --needed ovmf
sudo pacman -S --noconfirm --needed virt-manager
sudo pacman -S --noconfirm --needed qemu-arch-extra

##################################################################################################################
# Networking packages for QEMU/KVM
##################################################################################################################
sudo pacman -S --noconfirm --needed vde2
sudo pacman -S --noconfirm --needed dnsmasq
sudo pacman -S --noconfirm --needed ebtables
sudo pacman -S --noconfirm --needed bridge-utils
sudo pacman -S --noconfirm --needed openbsd-netcat

sudo systemctl enable libvirtd.service
sudo systemctl start libvirtd.service
sudo virsh net-autostart default

echo "################################################################"
echo "################### QEMU/KVM installed"
echo "you might need to install ebtables manually"
echo "################################################################"
