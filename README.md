# Dotfiles

A collection of my config files (aka dotfiles) from Arch Linux. I prefer lightweight Linux setup, so most things are configured by editing config files with a text editor intead of using GUI tools.

| application / program  | description | config file(s) |
| ------------- | ------------- | ------------- |
| [dunst](https://www.archlinux.org/packages/community/i686/dunst/) | notification daemon | `.config/dunst/dunstrc` |
| [freetype2](https://www.archlinux.org/packages/extra/x86_64/freetype2/)<sup>1</sup> | font rendering library | `.config/fontconfig/fonts.conf` |
| bash || `.bashrc`, `.bash_profile`  |
| vim || `.vimrc` |
| i3  || `.i3/config`, `i3status.conf`  |
| midnight commander  || `.config/mc/*`  |
| xxkb || `.xxkb/*`, `.xxkbrc`  |
| xorg || `.Xdefaults`, `.xinitrc`  |
| mimeapps  || `.local/share/applications/mimeapps.list`  |

<hr>
<sup>1</sup> config file stopped working with freetype2 above 2.6.5-2. See [#1](https://github.com/rubickcz/dotfiles/issues/1)

## Installation

Clone the repository and execute `makesymlinks.sh` script, which:

1. backups any existing config files in your home directory 
2. creates symlinks to config files in this repository.

## Dependencies

Apart from programs listed in the table above, following dependencies shall also be installed to make config options work well:

### Arch Linux packages
* [chromium](https://www.archlinux.org/packages/extra/x86_64/chromium/)
* [dina-font](https://www.archlinux.org/packages/community/any/dina-font/)
* [dmenu](https://www.archlinux.org/packages/community/x86_64/dmenu/)
* [ttf-dejavu](https://www.archlinux.org/packages/extra/any/ttf-dejavu/)

### Scripts in PATH (check [my scripts](https://github.com/rubickcz/scripts)):
* alert.sh - plays a notification sound
