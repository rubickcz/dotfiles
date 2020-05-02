#!/bin/bash

# install_packages.sh
# ===============
# Installs packages.

SCRIPT_DIR=`dirname $(readlink -f $0)`
source "$SCRIPT_DIR/functions.sh"
source "$SCRIPT_DIR/packages.sh"

# ------------------------------------------------------------------------------
# Global variables
# ------------------------------------------------------------------------------

SCRIPTS_REPO_URL="https://github.com/rubickcz/scripts"

# ------------------------------------------------------------------------------
# Logic
# ------------------------------------------------------------------------------

# synchronize package databases
title "Syncing package databases..."
sudo pacman -Sy

# install initial pakcages
title "Installing initial packages..."
sudo pacman -S --needed $INITIAL_PACKAGES

# install yay
if [ `has_pkg yay` -ne 0 ]; then
    title "Installing yay..."
    cd /tmp
    wget https://aur.archlinux.org/cgit/aur.git/snapshot/yay.tar.gz
    tar xzvf yay.tar.gz
    cd yay
    makepkg -fs
    sudo pacman -U --needed *tar.xz
fi

# install rest of packages
title "Installing packages and desktop apps..."
yay -S --needed $PACKAGES $DESKTOP_APPS

# install scripts
which alert.sh &>/dev/null
if [ $? -ne 0 ]; then
    title "Installing sripts..."

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
    mkdir -p "$HOME/bin/"
    ln -s "$REPO_PATH" "$HOME/bin/"
fi

# Enable services
title "Enabling services..."
set -x
sudo systemctl enable ntpd.service
sudo systemctl enable org.cups.cupsd.service
sudo systemctl enable bluetooth.service
sudo systemctl enable docker.service
set +x

# Add user to common groups
title "Adding you to common groups..."
sudo gpasswd -a "$USER" wheel
sudo gpasswd -a "$USER" audio
sudo gpasswd -a "$USER" video
sudo gpasswd -a "$USER" uucp
sudo gpasswd -a "$USER" lp
sudo gpasswd -a "$USER" docker

success "Done"
