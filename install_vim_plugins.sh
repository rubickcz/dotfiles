#!/bin/bash

# install_vim_plugins.sh
# ======================
# Installs Vim plugins.

source ./functions.sh

# ------------------------------------------------------------------------------
# Global variables
# ------------------------------------------------------------------------------

# path where Vundle will be installed
VUNDLE_PATH="$HOME/.vim/bundle/Vundle.vim"

# Vim undo dir
VIM_UNDO_DIR="$HOME/.vim/undo/"

# ------------------------------------------------------------------------------
# Logic
# ------------------------------------------------------------------------------

msg "Installing Vim plugins..."

# clone Vundle
if [ ! -d "$VUNDLE_PATH" ]; then
    git clone https://github.com/VundleVim/Vundle.vim.git "$VUNDLE_PATH"
fi

# open Vim and install plugins
vim -c "PluginInstall" -c "qall"

# create Vim undo dir
if [ ! -d "$VIM_UNDO_DIR" ]; then
    mkdir -p "$VIM_UNDO_DIR"
fi

success "Done installing Vim plugins"
