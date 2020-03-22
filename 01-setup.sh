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

## start 02

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

