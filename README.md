# Dotfiles

Collection of my config files (aka dotfiles) from Arch Linux.

| Application / program  | Config file(s) |
| ------------- | ------------- |
| bash | `.bashrc`, `.bash_profile`  |
| vim | `.vimrc` |
| i3  | `.i3/config`, `i3status.conf`  |
| midnight commander  | `.config/mc/*`  |
| dust  | `.config/dunst/dunstrc` |
| xxkb | `.xxkb/*`, `.xxkbrc`  |
| xorg | `.Xdefaults`, `.xinitrc`  |
| mimeapps  | `.local/share/applications/mimeapps.list`  |

## Installation

Clone the repository and execute `makesymlinks.sh` script, which:

1. backups any existing config files in your home directory 
2. creates symlinks to config files in this repository.
