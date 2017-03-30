# Dotfiles

A collection of my config files (aka dotfiles) from Arch Linux. This project is intended to quickly setup my customized environment on a new machine.

## What's included?

| application / program  | description | config file(s) |
| ------------- | ------------- | ------------- |
| [dunst](https://www.archlinux.org/packages/community/i686/dunst/) | notification daemon | [`.config/dunst/dunstrc`](https://github.com/rubickcz/dotfiles/blob/master/dotfiles/.config/dunst/dunstrc) |
| [freetype2](https://www.archlinux.org/packages/extra/x86_64/freetype2/)<sup>1</sup> | font rendering library | [`.config/fontconfig/fonts.conf`](https://github.com/rubickcz/dotfiles/blob/master/dotfiles/.config/fontconfig/fonts.conf) |
| [i3](https://www.archlinux.org/groups/x86_64/i3/)  | window manager | [`.i3/config`](https://github.com/rubickcz/dotfiles/blob/master/dotfiles/.i3/config) |
| [i3pystatus](https://aur.archlinux.org/packages/i3pystatus/)  | i3status replacement | [`.config/pystatus.py`](https://github.com/rubickcz/dotfiles/blob/master/dotfiles/.config/pystatus.py) |
| [GTK+](https://www.archlinux.org/packages/extra/x86_64/gtk2/)  | widget-toolkit | [`.gtkrc-2.0`](https://github.com/rubickcz/dotfiles/blob/master/dotfiles/.gtkrc-2.0) |
| [midnight commander](https://www.archlinux.org/packages/community/x86_64/mc/)  | file manager | [`.config/mc/`](https://github.com/rubickcz/dotfiles/tree/master/dotfiles/.config/mc)  |
| [Qt4](https://www.archlinux.org/packages/extra/x86_64/freetype2/) | widget toolkit | [`.config/Trolltech.conf`](https://github.com/rubickcz/dotfiles/blob/master/dotfiles/.config/Trolltech.conf) |
| [X.org](https://www.archlinux.org/packages/extra/x86_64/freetype2/) | display server | [`.config/user-dirs.dirs`](https://github.com/rubickcz/dotfiles/blob/master/dotfiles/.config/user-dirs.dirs)<br>[`.local/share/applications/mimeapps.list`](https://github.com/rubickcz/dotfiles/blob/master/dotfiles/.local/share/applications/mimeapps.list)<br>[`.xinitrc`](https://github.com/rubickcz/dotfiles/blob/master/dotfiles/.xinitrc)  |
| [xxkb](https://www.archlinux.org/packages/community/x86_64/xxkb/)<sup>2</sup> | keyboard layout indicator |[`.xxkb/`](https://github.com/rubickcz/dotfiles/tree/master/dotfiles/.xxkb)<br>[`.xxkbrc`](https://github.com/rubickcz/dotfiles/blob/master/dotfiles/.xxkbrc)  |
| [rxvt-unicode](https://www.archlinux.org/packages/community/x86_64/rxvt-unicode/) | terminal emulator | [`.Xdefaults`](https://github.com/rubickcz/dotfiles/blob/master/dotfiles/.Xdefaults) |
| [bash](https://www.archlinux.org/packages/core/x86_64/bash/) | unix shell | [`.bash_profile`](https://github.com/rubickcz/dotfiles/blob/master/dotfiles/.bash_profile)<br>[`.bashrc`](https://github.com/rubickcz/dotfiles/blob/master/dotfiles/.bashrc)  |
| [vim](https://www.archlinux.org/packages/extra/x86_64/gvim/)  | text editor | [`.vimrc`](https://github.com/rubickcz/dotfiles/blob/master/dotfiles/.vimrc) |

#### Notes
<sup>1</sup> config file stopped working with freetype2 above 2.6.5-2, see https://github.com/rubickcz/dotfiles/issues/1<br> 
<sup>2</sup> xxkb is currently not used, see https://github.com/rubickcz/dotfiles/issues/3

## Installation

1. Clone the repository
```
$ git clone https://github.com/rubickcz/dotfiles.git && cd dotfiles
```
2. Execute `installdeps.sh` to install dependencies
```
$ ./installdeps.sh
```
3. Install my [scripts](https://github.com/rubickcz/scripts)

4. Execute `makesymlinks.sh` to backup any existing config files in your home directory and replace them with symlinks to config files in this repository
```
$ ./makesymlinks.sh
```

## Post install
Following steps should be done after installation.

### Install Vim plugins
1. Install [Vundle.vim](https://github.com/VundleVim/Vundle.vim)
```
$ git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim
```
2. Launch `vim` and issue `:PluginInstall` command

### Set wallpaper
Copy your favorite wallpaper to `~/media/images/wallpapers/current.jpg`

### Add private stuff
These things are not included in this repository:
* SSH and PGP keys
* Encrypted password store
* `.bashrc_private` file with custom aliases


