#!/bin/bash

# installdeps.sh
# ---------------
# Installs dependendies

# Install official pakcages
sudo pacman -Sy --needed  ack alsa-utils autocutsel base-devel bash bash-completion chromium ctags feh freetype2 dina-font dmenu dunst gnupg gsimplecal gtk-engines gvim htop i3 libnotify mc network-manager-applet numlockx openssh pass polkit python-isort python-netifaces python-psutil python-virtualenvwrapper rxvt-unicode ttf-font-awesome ttf-dejavu udevil xorg xorg-xinit xorg-xinput xorg-xrandr xxkb wget

# Install Aurget
cd /tmp
wget https://aur.archlinux.org/cgit/aur.git/snapshot/aurget.tar.gz
tar xzvf aurget.tar.gz
cd aurget
makepkg -f
sudo pacman -U --needed *tar.xz

# Install AUR packages
aurget -S i3pystatus fbxkb python-colour python-pyalsaaudio
