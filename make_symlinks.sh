#!/bin/bash

# makesymlinks.sh
# ===============
# Backups original config files in your $HOME directory and replaces them with
# symlinks pointing to config files in this repository.
#
# Inspired by:
# http://blog.smalleycreative.com/tutorials/using-git-and-github-to-manage-your-dotfiles/

source ./functions.sh

# ----------------
# Global variables
# ----------------

# original dotfiles backup directory
BACKUP_DIR="$PWD/backup/`date "+%Y-%m-%d_%H%M%S"`"

# -----
# Logic
# -----

msg "Creating dotfiles symlinks..."

echo "Creating a backup directory: $BACKUP_DIR/"
mkdir -p $BACKUP_DIR

echo "Moving existing dotfiles to the backup directory and creating symlinks:"
for FILE in `find dotfiles/ -type f`; do

    STATUS="OK"
    MESSAGE=""

    # remove "dotfiles/" part from $FILE and glue it with $HOME
    HOMEFILE="$HOME/${FILE#*/}"
    HOMEFILEPATH=`dirname $HOMEFILE`

    # if a directory does not exist, create it
    if ! [ -d "$HOMEFILEPATH" ]; then
        mkdir -p "$HOMEFILEPATH"
    fi

    # if the config file already exists, backup it (backs up even symlinks)
    if [ -e "$HOMEFILE" ]; then
        mkdir -p "${BACKUP_DIR}${HOMEFILEPATH}"
        mv "$HOMEFILE" "${BACKUP_DIR}${HOMEFILEPATH}"
    fi

    # create symlink
    ln -fs "$PWD/$FILE" "$HOMEFILEPATH"

    echo "* $HOMEFILE"

done

success "Done making symlinks"
