#!/bin/bash

##Update----------------------------------------------------------------
pacman -Syyu

##Install XORG and LightDM-----------------------------------------------
pacman -S xorg --noconfirm
pacman -S lightdm --noconfirm
