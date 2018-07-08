#!/bin/bash

# setup.sh
# ===============
# Runs complete dotfiles installation procedure by executing series of scripts
# that do specific tasks. The scripts can be also executed directly.

source ./functions.sh

echo "~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~"
msg  "Welcome to rubick's dotfiles setup!"
echo "~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~"
echo "The setup has a few steps, you will be asked if you want to proceed or skip at each step."
echo "If installing for the first time, you should go through all steps."

yes_no_question "STEP #1: Do you want to install packages?"
if [ $? -eq 0 ]; then
    ./install_packages.sh
    if [ $? -ne 0 ]; then
        exit $?
    fi
fi

yes_no_question "STEP #2: Do you want to make dotfiles symlinks?"
if [ $? -eq 0 ]; then
    ./make_symlinks.sh
    if [ $? -ne 0 ]; then
        exit $?
    fi
fi

yes_no_question "STEP #3: Do you want to install Vim plugins?"
if [ $? -eq 0 ]; then
    ./install_vim_plugins.sh
    if [ $? -ne 0 ]; then
        exit $?
    fi
fi

touch "$HOME/.bashrc_private"

echo "~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~"
msg  "Dotfiles setup complete! :-)"
echo "~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~"
