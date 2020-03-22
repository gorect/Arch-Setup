#!/bin/bash
sudo pacman -Syyu
sudo pacman -S gnome --noconfirm
sudo systemctl enable gdm.service
sudo systemctl start gdm.service
sudo reboot
