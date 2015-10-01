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

BACKUP_DIR="$PWD/backup/`date "+%Y-%m-%d_%H%M%S"`"             # old dotfiles backup directory
FILES=".bash_profile .bashrc .i3 .i3status.conf .Xdefaults .config/mc"    # list of files/folders to symlink in homedir

# Create the backup dirctory
echo ":: Creating backup directory: $BACKUP_DIR/"
mkdir -p $BACKUP_DIR
		
echo ":: Moving existing dotfiles to backup directory and creating symlinks:"

for FILE in $FILES; do

	echo "-> $FILE"

	# copy the existing dotfile to the backup directory
	if [ -e "$HOME/$FILE" ]; then
		mv "$HOME/$FILE" "$BACKUP_DIR"
	fi

	# create symlink
	if [ -e "$PWD/$FILE" ]; then
		ln -s "$PWD/$FILE" "$HOME/`dirname $FILE`"
	else
		echo "ERROR: Cannot create a symlink for $FILE (file not found)."	
	fi

done
