#!/bin/bash

passwd

echo "en_US.UTF-8 UTF-8" >> /etc/locale.gen

locale-gen
ln -sf /usr/share/zoneinfo/America/New_York /etc/localtime
hwclock --systohc
echo "LANG=en_US.UTF-8" >> /etc/locale.conf

echo "arch" >> /etc/hostname

echo "127.0.0.1	 localhost" >> /etc/hosts
echo "::1			   localhost" >> /etc/hosts
echo "127.0.1.1	 arch.localdomain arch" >> /etc/hosts

pacman -S dhcp --noconfirm
pacman -S dhcpcd --noconfirm
systemctl enable dhcpcd

pacman -S sudo --noconfirm

echo "wheel ALL=(ALL)" >> /etc/sudoers

pacman -S grub --noconfirm
grub-install /dev/sda
grub-mkconfig -o /boot/grub/grub.cfg

pacman -S xorg --noconfirm
pacman -S lightdm --noconfirm

exit 
