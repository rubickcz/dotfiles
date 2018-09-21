#!/bin/bash

# install_packages.sh
# ===============
# Installs packages.

source ./functions.sh

# ------------------------------------------------------------------------------
# Global variables
# ------------------------------------------------------------------------------

# packages to be installed via pacman
PACKAGES="ack alsa-utils base-devel bash bash-completion cups chromium ctags feh freetype2 dina-font dmenu dnsutils dunst gnupg gsimplecal gtk-engines gvim htop i3 libnotify mc network-manager-applet networkmanager-openvpn ntfs-3g ntp numlockx openssh pass polkit python-isort python-jedi python-netifaces python-psutil python-virtualenvwrapper rxvt-unicode tk ttf-font-awesome ttf-dejavu udevil unrar unzip xdg-user-dirs xdotool xf86-input-libinput xorg xorg-xinit xorg-xinput xorg-xrandr xxkb wget zip"

# common apps
APP_PACKAGES="audacity evince gimp inkscape transmission-gtk vlc"

# packages to be installed via aurget
AUR_PACKAGES="i3pystatus betaflight-configurator fbxkb python-colour python-pyalsaaudio"

# rubick's scripts repo url
SCRIPTS_REPO_URL="https://github.com/rubickcz/scripts"

# ------------------------------------------------------------------------------
# Functions
# ------------------------------------------------------------------------------

function has_pkg() {
    pacman -Q $1 &>/dev/null
    echo $?
}

# ------------------------------------------------------------------------------
# Logic
# ------------------------------------------------------------------------------

# Install official pakcages
msg "Installing official packages..."
sudo pacman -Sy --needed $PACKAGES $APP_PACKAGES

# Install Aurget
if [ `has_pkg aurget` -ne 0 ]; then
    msg "Installing aurget..."
    cd /tmp
    wget https://aur.archlinux.org/cgit/aur.git/snapshot/aurget.tar.gz
    tar xzvf aurget.tar.gz
    cd aurget
    makepkg -f
    sudo pacman -U --needed *tar.xz
fi

# Install AUR packages
for pkg in $AUR_PACKAGES; do
    if [ `has_pkg $pkg` -ne 0 ]; then
        msg "Installing $pkg..."
        aurget -S $pkg
    fi
done

# Install rubick's scripts
which alert.sh &>/dev/null
if [ $? -ne 0 ]; then
    msg "Installing rubick's scripts..."

    # ask for repo path
    question "Where to clone the scripts repo? [$HOME/projects/scripts/]"
    read -e REPO_PATH
    if [ "$REPO_PATH" == "" ]; then
        REPO_PATH="$HOME/projects/scripts/"
    fi

    # check if repo path exists
    if [ -a "$REPO_PATH" ]; then
        error "$REPO_PATH already exists!"
        exit 1
    fi

    # clone the repo
    mkdir -p "$REPO_PATH"
    git clone "$SCRIPTS_REPO_URL" "$REPO_PATH"

    # symlink to PATH
    mkdir "$HOME/bin/"
    ln -s "$REPO_PATH" "$HOME/bin/"
fi

# Post install procedures
sudo systemctl enable ntpd.service
sudo systemctl enable org.cups.cupsd.service

success "Done installing dependencies"
