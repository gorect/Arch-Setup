#!/bin/bash
echo "Make File System"
mkfs.ext4 -F /dev/sda1
mount /dev/sda1 /mnt

echo "nameserver 8.8.4.4" >> /etc/resolv.conf
echo "nameserver 8.8.8.8" >> /etc/resolv.conf

##Grab the completed pacman mirrorlist
wget https://raw.github.com/gorect/Arch-setup-guide/master/USmirrorlist

pacstrap /mnt base linux linux-firmware

genfstab -U /mnt >> /mnt/etc/fstab

arch-chroot /mnt

##end 01
