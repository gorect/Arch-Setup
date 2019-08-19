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
