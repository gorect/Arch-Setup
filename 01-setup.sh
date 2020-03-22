#!/bin/bash
echo "Make File System"
mkfs.ext4 -F /dev/sda1
mount /dev/sda1 /mnt

echo "nameserver 8.8.4.4" >> /etc/resolv.conf
echo "nameserver 8.8.8.8" >> /etc/resolv.conf

pacstrap /mnt base linux linux-firmware

genfstab -U /mnt >> /mnt/etc/fstab

arch-chroot /mnt

##end 01
