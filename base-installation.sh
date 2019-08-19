#Check Date and Time---------------------------------------------------------------
timedatectl set-ntp true
timedatectl status

sleep 10

#Format the Partitions-------------------------------------------------------------
echo "mkfs.ext4 /dev/sda1"
mkfs.ext4 /dev/sda1
echo "mkswap /dev/sda2"
mkswap /dev/sda2
echo "swapon /dev/sda2"
swapon /dev/sda2
echo "mount /dev/sda1 /mnt"
mount /dev/sda1 /mnt

#Install the Base Arch System-------------------------------------------------------
echo"pacstrap /mnt base"
pacstrap /mnt base

#Fstab------------------------------------------------------------------------------
echo "genfstab -U /mnt >> /mnt/etc/fstab"
genfstab -U /mnt >> /mnt/etc/fstab

#Chroot-----------------------------------------------------------------------------
echo "arch-chroot /mnt"
arch-chroot /mnt

#Reflector--------------------------------------------------------------------------
echo "pacman -S reflector"
pacman -S reflector --noconfirm

echo "cp /etc/pacman.d/mirrorlist /etc/pacman.d/mirrorlist.backup"
cp /etc/pacman.d/mirrorlist /etc/pacman.d/mirrorlist.backup

echo "reflector --verbose -l 200 -p http --sort rate --save /etc/pacman.d/mirrorlist"
reflector --verbose -l 200 -p http --sort rate --save /etc/pacman.d/mirrorlist

echo "sudo nano /etc/pacman.d/hooks/mirrorupgrade.hook"
sudo nano /etc/pacman.d/hooks/mirrorupgrade.hook

## cd to Reflector-hook.sh to move the hook file to the proper dir

#Set Local Time Zone-----------------------------------------------------------------
echo "en_US.UTF-8 UTF-8" > /etc/locale.gen
echo "locale-gen"
locale-gen
echo "ln -sf /usr/share/zoneinfo/America/New_York /etc/localtime"
ln -sf /usr/share/zoneinfo/America/New_York /etc/localtime
echo "hwclock --systohc"
hwclock --systohc
echo "LANG=en_US.utf-8" > /etc/locale.conf

# Hostname Configuration-------------------------------------------------------------

## create the hostname from the nano /etc/hostname script
touch /etc/hostname
echo "TestHostname" > /etc/hostname

## cd to /etc/hosts and add the 127.0.0.1 info from file

# Network Configuration--------------------------------------------------------------
echo "systemctl enable dhcpcd"
systemctl enable dhcpcd

#Install Sudo------------------------------------------------------------------------
echo "pacman -S sudo"
pacman -S sudo --noconfirm

#Install VIM-------------------------------------------------------------------------
echo "pacman-S vim"
pacman-S vim

#Install the Boot Loader-------------------------------------------------------------
echo "pacman -S grub"
pacman -S grub --noconfirm
echo "grub-install /dev/sda"
grub-install /dev/sda
echo "grub-mkconfig -o /boot/grub/grub.cfg"
grub-mkconfig -o /boot/grub/grub.cfg

exit

#Finished Message!!!-----------------------------------------------------------------
echo "The Arch Installation Script has completed!!! "
echo "Before you reboot you should: "
echo "       reset the Root Password"
echo "       add users"
echo "       use visudo to enable the wheel group"
echo "       Eject to Installation media"
echo " "
echo "For now manually set the /etc/hosts file (hint 1270.0.1...)"
echo " "
echo "Then you my reboot the system and install any GUI that you wish to use."




###### --noconfirm
