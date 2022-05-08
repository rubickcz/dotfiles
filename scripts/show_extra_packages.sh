#!/bin/bash

# show_extra_packages.sh
# ===============
# Show packages that are installed but are not part of dotfiles

SCRIPT_DIR=`dirname $(readlink -f $0)`
source "$SCRIPT_DIR/functions.sh"
source "$SCRIPT_DIR/packages.sh"

DOTFILES_PACKAGES=$(echo $INITIAL_PACKAGES $MAIN_PACKAGES $WORK_PACKAGES $DESKTOP_APPS yay $(pacman -Qg base-devel | awk '{ print $2 }'))
INSTALLED_PACKAGES=$(pacman -Qte  | awk '{ print $1 }')

title "Extra packages installed on this system:"
for package in $INSTALLED_PACKAGES; do
    echo $DOTFILES_PACKAGES | grep $package > /dev/null
    if [ $? -ne 0 ]; then
        echo $package
    fi
done

title "Dotfiles packages that are not installed:"
for package in $DOTFILES_PACKAGES; do
    pacman -Q $package > /dev/null 2> /dev/null
    if [ $? -ne 0 ]; then
        echo $package
    fi
done
