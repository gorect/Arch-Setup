# Arch-setup-guide
A step by step guide for creating an Arch virtual machine
Special thanks to Derek Taylor from DistroTube (Https://www.distrotube.com/) and HowtoForge (Https://www.HowtoForge.com/tutorial/install-arch-linux-on-virtualbox) for being the juming off point for this project. After many failed attempts at installing arch both on physical hardware and as a virtual machine, your guide finally my installation to successfully post after exiting the installation and rebooting.

When trying to wget any of these files from an Arch machine during the actual installation process remember to use the https://raw.github address to pull down the files and not the html.

Example: https://raw.github.com/gorect/Arch-setup-guide/master/01-setup.sh

## Using Wget
When using the bash 02-chroot.sh once you have entered chroot you will first need to downkoad and install wget as it is not included in the environment by default. 
```
pacman -S wget --noconfirm
```
After that you will be able to wget the bash script and continue with the installation.
