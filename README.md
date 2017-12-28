# Dotfiles

A collection of my config files (aka dotfiles) from Arch Linux. This project is intended to quickly setup my customized environment on a new machine. 

Here's a quick look what you get after installation (click to full size):

![Appearance of the configured desktop](https://raw.githubusercontent.com/rubickcz/dotfiles/master/desktop.png)

## What's included?

| application / program  | description | config file(s) |
| ------------- | ------------- | ------------- |
| [dunst](https://www.archlinux.org/packages/community/i686/dunst/) | notification daemon | [`.config/dunst/dunstrc`](https://github.com/rubickcz/dotfiles/blob/master/dotfiles/.config/dunst/dunstrc) |
| [freetype2](https://www.archlinux.org/packages/extra/x86_64/freetype2/) | font rendering library | [`.config/fontconfig/fonts.conf`](https://github.com/rubickcz/dotfiles/blob/master/dotfiles/.config/fontconfig/fonts.conf) |
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

<sup>2</sup> xxkb is currently not used, see https://github.com/rubickcz/dotfiles/issues/3

## Prerequisites
It is assumed you have the base Arch Linux system installed (follow [installation guide](https://wiki.archlinux.org/index.php/Installation_guide)). There's no need to install Xorg or any desktop environment, as it will be installed during dotfiles setup. The only thing you should do is to create a normal user and make sure `sudo` command works.

## Installation
1. Clone the repository
```
$ git clone https://github.com/rubickcz/dotfiles.git && cd dotfiles
```
2. Execute `setup.sh` and follow instructions.
```
$ ./setup.sh
```

## Post install

1. Install [Vundle.vim](https://github.com/VundleVim/Vundle.vim)
```
$ git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim
```
2. Launch `vim` and issue `:PluginInstall` command
3. Copy your favorite wallpaper to `~/media/images/wallpapers/current.jpg`
4. Add private stuff (not included in this repo):
    * SSH and PGP keys
    * Encrypted password store
    * `.bashrc_private` file with custom aliases
    
### Marshadow specific
1. Enable `hdparm` command to be launched via sudo without password by adding this line via `visudo`:
```
ondra ALL=(ALL) NOPASSWD: /usr/bin/hdparm
```

## Note

Some config files contain hardware dependent options for specific machines. A machine is recognized by its hostname. Currently, I have following machines:
* **golem** - Desktop PC
* **marshadow** - Dell laptop
