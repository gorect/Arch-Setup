#!/bin/bash

##Update system--------------------------------------------------------------------
sudo pacman -Syyu

##Install Full Gnome with Defaults-------------------------------------------------
sudo pacman -S gnome --noconfirm

##Enable and Start Gnome severices-------------------------------------------------
sudo systemctl enable gdm.service
sudo systemctl start gdm.service

sudo reboot
