#Check Date and Time---------------------------------------------------------------
timedatectl set-ntp true
timedatectl status

sleep 10

#Format the Partitions-------------------------------------------------------------
mkfs.ext4 /dev/sda1
mkswap /dev/sda2
swapon /dev/sda2
mount /dev/sda1 /mnt

#Install the Base Arch System-------------------------------------------------------
pacstrap /mnt base

#Fstab------------------------------------------------------------------------------
genfstab -U /mnt >> /mnt/etc/fstab

#Chroot-----------------------------------------------------------------------------
arch-chroot /mnt

#Reflector--------------------------------------------------------------------------
pacman -S reflector

cp /etc/pacman.d/mirrorlist /etc/pacman.d/mirrorlist.backup

reflector --verbose -l 200 -p http --sort rate --save /etc/pacman.d/mirrorlist

sudo nano /etc/pacman.d/hooks/mirrorupgrade.hook

## cd to Reflector-hook.sh to move the hook file to the proper dir

#Set Local Time Zone-----------------------------------------------------------------
echo "en_US.UTF-8 UTF-8" > /etc/locale.gen
locale-gen
ln -sf /usr/share/zoneinfo/America/New_York /etc/localtime
hwclock --systohc
echo "LANG=en_US.utf-8" > /etc/locale.conf

# Hostname Configuration-------------------------------------------------------------

## create the hostname from the nano /etc/hostname script
touch /etc/hostname
echo "TestHostname" > /etc/hostname

## cd to /etc/hosts and add the 127.0.0.1 info from file

# Network Configuration--------------------------------------------------------------
systemctl enable dhcpcd

#Install Sudo------------------------------------------------------------------------
pacman -S sudo

#Install VIM-------------------------------------------------------------------------
pacman-S vim

#Install the Boot Loader-------------------------------------------------------------
pacman -S grub
grub-install /dev/sda
grub-mkconfig -o /boot/grub/grub.cfg

exit

#Finished Message!!!-----------------------------------------------------------------
echo "The Arch Installation Script has completed!!! "
echo "Before you reboot you should: "
echo "       reset the Root Password"
echo "       add users"
echo "       use visudo to enable the wheel group"
echo " "
echo "For now manually set the /etc/hosts file (hint 1270.0.1...)"
echo " "
echo "Then you my reboot the system and install any GUI that you wish to use."




###### --noconfirm
