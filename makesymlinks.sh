#!/bin/bash

#########################################################################################
#
# makesymlinks.sh
# 
# Backup old config files in your $HOME directory and create symlinks 
# pointing to config files in the current directory.
#
# Inspired by:
# http://blog.smalleycreative.com/tutorials/using-git-and-github-to-manage-your-dotfiles/
#
#########################################################################################

# Variables

# old dotfiles backup directory
BACKUP_DIR="$PWD/backup/`date "+%Y-%m-%d_%H%M%S"`"
# list of files/folders to symlink in homedir
FILES=".bash_profile .bashrc .i3 .i3status.conf .Xdefaults .config/mc .config/dunst .local/share/applications/mimeapps.list .vimrc .xxkbrc .xxkb .config/fontconfig/fonts.conf"

#########################################################################################

# Create the backup dirctory
echo ":: Creating backup directory: $BACKUP_DIR/"
mkdir -p $BACKUP_DIR
		
echo ":: Moving existing dotfiles to backup directory and creating symlinks:"

for FILE in $FILES; do

    STATUS="OK"
    MESSAGE=""

    # check if this file is in the repository
	if [ -e "$PWD/$FILE" ]; then

        # check if symlink is not already created
        if ! [ -h "$HOME/$FILE" ]; then

            # if the config file already exists, backup it
            if [ -e "$HOME/$FILE" ]; then
                mv "$HOME/$FILE" "$BACKUP_DIR"
            fi

            # create symlink
            ln -s "$PWD/$FILE" "$HOME/`dirname $FILE`"

        else
            MESSAGE="Symlink already exists!"
            STATUS="!!"
        fi

	else
		MESSAGE="Cannot create a symlink for $FILE (file not found)!"	
        STATUS="!!"
	fi

	echo -n "[$STATUS] $FILE "
    if ! [ -z "$MESSAGE" ]; then
        echo -ne "\e[1;31m"
        echo -n "ERROR: $MESSAGE" 
        echo -ne "\e[0m"
    fi
    echo ""

done
