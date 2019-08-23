#Reflector--------------------------------------------------------------------------
echo "pacman -S reflector"
pacman -S reflector --noconfirm

echo "cp /etc/pacman.d/mirrorlist /etc/pacman.d/mirrorlist.backup"
cp /etc/pacman.d/mirrorlist /etc/pacman.d/mirrorlist.backup

echo "reflector --verbose -l 200 -p http --sort rate --save /etc/pacman.d/mirrorlist"
reflector --verbose -l 200 -p http --sort rate --save /etc/pacman.d/mirrorlist

echo "mkdir /etc/pacman.d/hooks/"
mkdir /etc/pacman.d/hooks/

sleep 5
## This section needs to be finished: until then continue to Time Zome

##echo "touch /etc/pacman.d/hooks/mirrorupgrade.hook"
##touch /etc/pacman.d/hooks/mirrorupgrade.hook

## Reflector-hook.sh to move the hook file to the proper dir
wget https://raw.githubusercontent.com/gorect/Arch-setup-guide/master/reflector-hook.sh
mv reflector-hook.sh /etc/pacman.d/hooks/mirrorupgrade.hook
echo "ls /etc/pacman.d/hooks/"
ls /etc/pacman.d/hooks/
sleep 5

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
pacman -S vim

#Install the Boot Loader-------------------------------------------------------------
echo "pacman -S grub"
pacman -S grub --noconfirm
echo "grub-install /dev/sda"
grub-install /dev/sda
echo "grub-mkconfig -o /boot/grub/grub.cfg"
sleep 5
grub-mkconfig -o /boot/grub/grub.cfg
sleep 5

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
