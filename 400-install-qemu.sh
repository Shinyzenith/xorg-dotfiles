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
yes | sudo pacman -S --noconfirm --needed dnsmasq
yes | sudo pacman -S --noconfirm --needed ebtables
sudo pacman -S --noconfirm --needed bridge-utils
sudo pacman -S --noconfirm --needed openbsd-netcat
sudo pacman -S --noconfirm --needed virtualbox # ik this isn't KVM but i just wanna separate it.
sudo dkms autoinstall
sudo modprobe vboxdrv

sudo systemctl enable libvirtd.service
sudo systemctl start libvirtd.service
sudo virsh net-autostart default

echo "A reboot might be required for all the kernel modules to work as intended"
echo "################################################################"
echo "################### QEMU/KVM installed"
echo "################### Please install ebtables manually"
echo "################################################################"
