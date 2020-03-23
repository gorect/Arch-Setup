#!/bin/bash

##Set Hostname-----------------------------------------------------------
echo "Please enter a hostname for the new system."
read -p 'Hostname: ' hostnamevar
echo ""

##Change Root Password---------------------------------------------------
echo "Please enter a new Root Password"
read -sp 'Password: ' passwdvar
echo "$passwdvar" | passwd --stdin root

##Reset /etc/resolv.conf------------Sometimes this does not survive------
##echo "nameserver 8.8.4.4" >> /etc/resolv.conf
##echo "nameserver 8.8.8.8" >> /etc/resolv.conf

##Set Locale.gen---------------------------------------------------------
echo "en_US.UTF-8 UTF-8" >> /etc/locale.gen
locale-gen
ln -sf /usr/share/zoneinfo/America/New_York /etc/localtime
hwclock --systohc
echo "LANG=en_US.UTF-8" >> /etc/locale.conf

##Set Hostname and Hosts File
echo $hostnamevar >> /etc/hostname

echo "127.0.0.1	 localhost" >> /etc/hosts
echo "::1			   localhost" >> /etc/hosts
echo "127.0.1.1	 $hostnamevar.localdomain $hostnamevar" >> /etc/hosts

##Install DHCP Service---------------------------------------------------
pacman -S dhcp --noconfirm
pacman -S dhcpcd --noconfirm
systemctl enable dhcpcd

##Install Sudo-----------------------------------------------------------
pacman -S sudo --noconfirm

##Import sudoers File
wget https://raw.github.com/gorect/Arch-setup-guide/master/sudoersFixed
cp /etc/sudoers /etc/sudoers.backup
mv sudoersFixed /etc/sudoers

##Install VIM-----------------------------------------------------------
pacman -S vim --noconfirm

##Install Grub-----------------------------------------------------------
pacman -S grub --noconfirm
grub-install /dev/sda
grub-mkconfig -o /boot/grub/grub.cfg

##Install XORG and LightDM-----------------------------------------------
pacman -S xorg --noconfirm
pacman -S lightdm --noconfirm

exit 
