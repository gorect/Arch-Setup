#!/bin/bash

##Update system--------------------------------------------------------------------
pacman -Syyu

##Install Full Gnome with Defaults-------------------------------------------------
pacman -S gnome --noconfirm

##Enable and Start Gnome severices-------------------------------------------------
systemctl enable gdm.service
systemctl start gdm.service

reboot
