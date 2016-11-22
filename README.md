# Dotfiles

A collection of my config files (aka dotfiles) from Arch Linux (desktop). I prefer lightweight Linux setup, so most things are configured by editing config files with a text editor intead of using GUI tools.

| application / program  | description | config file(s) |
| ------------- | ------------- | ------------- |
| [dunst](https://www.archlinux.org/packages/community/i686/dunst/) | notification daemon | `.config/dunst/dunstrc` |
| [freetype2](https://www.archlinux.org/packages/extra/x86_64/freetype2/)<sup>1</sup> | font rendering library | `.config/fontconfig/fonts.conf` |
| [Qt4](https://www.archlinux.org/packages/extra/x86_64/freetype2/) | widget toolkit | `.config/Trolltech.conf` |
| [X.org](https://www.archlinux.org/packages/extra/x86_64/freetype2/) | display server | `.config/user-dirs.dirs` |
| [i3](https://www.archlinux.org/groups/x86_64/i3/)  | window manager | `.i3/config`<br>`.i3status.conf`  |
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

## Optional dependencies

Some config files are using other programs/applications. In order to make everything work flawlessly, following dependencies shall be installed as well:

### Arch Linux packages
* [alsa-utils](https://www.archlinux.org/packages/extra/x86_64/alsa-utils/)
* [chromium](https://www.archlinux.org/packages/extra/x86_64/chromium/)
* [fbxkb](https://aur.archlinux.org/packages/fbxkb/)
* [feh](https://www.archlinux.org/packages/?name=feh)
* [dina-font](https://www.archlinux.org/packages/community/any/dina-font/)
* [dmenu](https://www.archlinux.org/packages/community/x86_64/dmenu/)
* [gnupg](https://www.archlinux.org/packages/core/x86_64/gnupg/)
* [gsimplecal](https://www.archlinux.org/packages/community/x86_64/gsimplecal/)
* [numlockx](https://www.archlinux.org/packages/community/x86_64/numlockx/)
* [pass](https://www.archlinux.org/packages/community/any/pass/)
* [rxvt-unicode](https://www.archlinux.org/packages/community/x86_64/rxvt-unicode/)
* [ttf-dejavu](https://www.archlinux.org/packages/extra/any/ttf-dejavu/)
* [udevil](https://www.archlinux.org/packages/community/x86_64/udevil/)
* [viber](https://aur.archlinux.org/packages/viber/)

### Scripts in PATH (check [my scripts](https://github.com/rubickcz/scripts)):
* alert.sh
* feh_browser.sh
* monitor_toggle.sh
