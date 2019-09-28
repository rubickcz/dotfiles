#!/bin/bash

# make_home_dirs.sh
# ===============
# Creates a default directory structure in home dir.

SCRIPT_DIR=`dirname $(readlink -f $0)`
source "$SCRIPT_DIR/functions.sh"

title "Creating home directory structure..."

set -x

mkdir -p ~/bin/
mkdir -p ~/docs/
mkdir -p ~/downloads/
mkdir -p ~/media/images/
mkdir -p ~/media/music/
mkdir -p ~/media/photos/
mkdir -p ~/media/videos/
mkdir -p ~/other/
mkdir -p ~/projects/
mkdir -p ~/tmp/

set +x

success "Done"
