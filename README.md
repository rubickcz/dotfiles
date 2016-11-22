# Dotfiles

A collection of my config files (aka dotfiles) from Arch Linux (desktop). I prefer lightweight Linux setup, so most things are configured by editing config files with a text editor intead of using GUI tools.

| application / program  | description | config file(s) |
| ------------- | ------------- | ------------- |
| [dunst](https://www.archlinux.org/packages/community/i686/dunst/) | notification daemon | `.config/dunst/dunstrc` |
| [freetype2](https://www.archlinux.org/packages/extra/x86_64/freetype2/)<sup>1</sup> | font rendering library | `.config/fontconfig/fonts.conf` |
| [i3](https://www.archlinux.org/groups/x86_64/i3/)  | window manager | `.i3/config` |
| [i3pystatus](https://www.archlinux.org/groups/x86_64/i3/)  | i3status replacement | `.config/pystatus.py` |
| [GTK+](https://www.archlinux.org/packages/extra/x86_64/gtk2/)  | widget-toolkit | `.gtkrc-2.0` |
| [midnight commander](https://www.archlinux.org/packages/community/x86_64/mc/)  | file manager | `.config/mc/*`  |
| [Qt4](https://www.archlinux.org/packages/extra/x86_64/freetype2/) | widget toolkit | `.config/Trolltech.conf` |
| [X.org](https://www.archlinux.org/packages/extra/x86_64/freetype2/) | display server | `.config/user-dirs.dirs`<br>`.local/share/applications/mimeapps.list`<br>`.xinitrc`  |
| [xxkb](https://www.archlinux.org/packages/community/x86_64/xxkb/)<sup>2</sup> | keyboard layout indicator |`.xxkb/*`<br>`.xxkbrc`  |
| [rxvt-unicode](https://www.archlinux.org/packages/community/x86_64/rxvt-unicode/) | terminal emulator | `.Xdefaults` |
| [bash](https://www.archlinux.org/packages/core/x86_64/bash/) | unix shell | `.bash_profile`<br>`.bashrc`  |
| [vim](https://www.archlinux.org/packages/extra/x86_64/gvim/)  | text editor | `.vimrc` |

<hr>
<sup>1</sup> config file stopped working with freetype2 above 2.6.5-2, see [#1](https://github.com/rubickcz/dotfiles/issues/1)  
<sup>2</sup> xxkb is currently not used, see [#3](https://github.com/rubickcz/dotfiles/issues/3)

## Installation

Clone the repository and execute `makesymlinks.sh` script, which:

1. backups any existing config files in your home directory 
2. replaces them with symlinks to config files in this repository

## Optional dependencies

Some config files are using other programs/applications. In order to make everything work flawlessly, following dependencies shall be installed as well:

### Arch Linux packages
* [alsa-utils](https://www.archlinux.org/packages/extra/x86_64/alsa-utils/)
* [bash-completion](https://www.archlinux.org/packages/extra/any/bash-completion/)
* [chromium](https://www.archlinux.org/packages/extra/x86_64/chromium/)
* [fbxkb](https://aur.archlinux.org/packages/fbxkb/)
* [feh](https://www.archlinux.org/packages/?name=feh)
* [dina-font](https://www.archlinux.org/packages/community/any/dina-font/)
* [dmenu](https://www.archlinux.org/packages/community/x86_64/dmenu/)
* [gnupg](https://www.archlinux.org/packages/core/x86_64/gnupg/)
* [gsimplecal](https://www.archlinux.org/packages/community/x86_64/gsimplecal/)
* [gtk-engines](https://www.archlinux.org/packages/extra/i686/gtk-engines/)
* [numlockx](https://www.archlinux.org/packages/community/x86_64/numlockx/)
* [pass](https://www.archlinux.org/packages/community/any/pass/)
* [python-colour](https://aur.archlinux.org/packages/python-colour/)
* [python-netifaces](https://www.archlinux.org/packages/community/x86_64/python-netifaces/)
* [python-psutil](https://www.archlinux.org/packages/community/x86_64/python-psutil/)
* [python-pyalsaaudio](https://aur.archlinux.org/packages/python-pyalsaaudio/)
* [ttf-dejavu](https://www.archlinux.org/packages/extra/any/ttf-dejavu/)
* [ttf-font-awesome](https://aur.archlinux.org/packages/ttf-font-awesome/)
* [udevil](https://www.archlinux.org/packages/community/x86_64/udevil/)<sup>1</sup>
* [viber](https://aur.archlinux.org/packages/viber/)
* [xorg-xrandr](https://www.archlinux.org/packages/?name=xorg-xrandr)

### Scripts in PATH (check [my scripts](https://github.com/rubickcz/scripts)):
* alert.sh
* feh_browser.sh
* monitor_toggle.sh

<hr>
<sup>1</sup> enable devmon service with `systemctl enable devmon@username.service`
