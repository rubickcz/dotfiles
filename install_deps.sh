#!/bin/bash

# install_deps.sh
# ===============
# Installs dependendent packages.

source ./functions.sh

# ------------------------------------------------------------------------------
# Global variables
# ------------------------------------------------------------------------------

# packages to be installed via pacman
PACKAGES="ack alsa-utils base-devel bash bash-completion chromium ctags feh freetype2 dina-font dmenu dunst gnupg gsimplecal gtk-engines gvim htop i3 libnotify mc network-manager-applet networkmanager-openvpn ntfs-3g numlockx openssh pass polkit python-isort python-netifaces python-psutil python-virtualenvwrapper rxvt-unicode ttf-font-awesome ttf-dejavu udevil unrar xdg-user-dirs xdotool xf86-input-libinput xorg xorg-xinit xorg-xinput xorg-xrandr xxkb wget"

# packages to be installed via aurget
AUR_PACKAGES="i3pystatus fbxkb imwheel python-colour python-pyalsaaudio"

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
sudo pacman -Sy --needed $PACKAGES

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

success "Done installing dependencies"
