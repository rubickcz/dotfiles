# Dotfiles

A collection of my config files (aka dotfiles) from Arch Linux. This project is intended to quickly setup my customized environment on a new machine. 

Here's a quick look what you get after installation (click to full size):

![Appearance of the configured desktop](https://raw.githubusercontent.com/rubickcz/dotfiles/master/img/desktop.png)

## What's included?

| application / program  | description | config file(s) |
| ------------- | ------------- | ------------- |
| [dunst](https://www.archlinux.org/packages/community/i686/dunst/) | notification daemon | [`.config/dunst/dunstrc`](https://github.com/rubickcz/dotfiles/blob/master/dotfiles/.config/dunst/dunstrc) |
| [freetype2](https://www.archlinux.org/packages/extra/x86_64/freetype2/) | font rendering library | [`.config/fontconfig/fonts.conf`](https://github.com/rubickcz/dotfiles/blob/master/dotfiles/.config/fontconfig/fonts.conf) |
| [i3](https://www.archlinux.org/groups/x86_64/i3/)  | window manager | [`.i3/config`](https://github.com/rubickcz/dotfiles/blob/master/dotfiles/.i3/config) |
| [i3pystatus](https://aur.archlinux.org/packages/i3pystatus-git/)  | i3status replacement | [`.config/pystatus.py`](https://github.com/rubickcz/dotfiles/blob/master/dotfiles/.config/pystatus.py) |
| [gtk2](https://www.archlinux.org/packages/extra/x86_64/gtk2/)  | widget-toolkit | [`.gtkrc-2.0`](https://github.com/rubickcz/dotfiles/blob/master/dotfiles/.gtkrc-2.0) |
| [mc](https://www.archlinux.org/packages/community/x86_64/mc/)  | file manager | [`.config/mc/`](https://github.com/rubickcz/dotfiles/tree/master/dotfiles/.config/mc)  |
| [openssh](https://www.archlinux.org/packages/core/x86_64/openssh/)  | secure shell | [`.ssh/config`](https://github.com/rubickcz/dotfiles/tree/master/dotfiles/.ssh/config)  |
| [xorg](https://www.archlinux.org/packages/extra/x86_64/freetype2/) | display server | [`.config/user-dirs.dirs`](https://github.com/rubickcz/dotfiles/blob/master/dotfiles/.config/user-dirs.dirs)<br>[`.local/share/applications/mimeapps.list`](https://github.com/rubickcz/dotfiles/blob/master/dotfiles/.local/share/applications/mimeapps.list)<br>[`.xinitrc`](https://github.com/rubickcz/dotfiles/blob/master/dotfiles/.xinitrc)  |
| [rxvt-unicode](https://www.archlinux.org/packages/community/x86_64/rxvt-unicode/) | terminal emulator | [`.Xdefaults`](https://github.com/rubickcz/dotfiles/blob/master/dotfiles/.Xdefaults) |
| [bash](https://www.archlinux.org/packages/core/x86_64/bash/) | unix shell | [`.bash_profile`](https://github.com/rubickcz/dotfiles/blob/master/dotfiles/.bash_profile)<br>[`.bashrc`](https://github.com/rubickcz/dotfiles/blob/master/dotfiles/.bashrc)  |
| [vim](https://www.archlinux.org/packages/extra/x86_64/gvim/)  | text editor | [`.vimrc`](https://github.com/rubickcz/dotfiles/blob/master/dotfiles/.vimrc) |

`~/.xinitrc` contains hardware dependent options for specific machines. A machine is recognized by its hostname. This is a list of machines I've been using my dotfiles on (I might not be using all of them, but I decided to keep the configs):
* **golem** - Desktop PC
* **marshadow** - Dell E6400
* **guzzlord** - Acer Aspire 5
* **lumineon** - Thinkpad X220

## Pre install
You need to install base Arch Linux system. Either follow [installation guide](https://wiki.archlinux.org/index.php/Installation_guide) or use [Anarchy Linux](https://www.anarchylinux.org/). There's no need to install Xorg, desktop environment or any additional packages, as they will be installed during dotfiles setup. You should just be able to log in as a normal user and make sure `sudo` command works.

## Installation
1. Clone the repository (you will probably need to install [git](https://www.archlinux.org/packages/extra/x86_64/git/)):
```
$ git clone https://github.com/rubickcz/dotfiles.git && cd dotfiles
```

2. Execute `setup.sh` and follow instructions:
```
$ ./setup.sh
```

3. Install HW dependent packages:
* Depending on your CPU, install [microcode updates](https://wiki.archlinux.org/index.php/Microcode).
* Install video drivers:
    * for nVidia: `pacman -S nvidia nvidia-settings`
    * for Intel: [wiki](https://wiki.archlinux.org/index.php/Intel_graphics) 

4. Reboot and log in again to load X.org and i3 window manager.

## Post install
Following steps were not automated by a script, because it is easier/more convenient to do them by hand.

#### SSH
* Copy your SSH keys to `~/.ssh`
* Copy your private host settings to `~/.ssh/hosts`

#### GPG keys
Import your keys to GnuPG:
```
$ gpg --import /path/to/secret.key
```

#### Encrypted password store
`pass` utility is used to manage passwords, encrypted passwords can be fetched from a private git repo:
```
git clone <repo_url> ~/.password-store
```

#### Private .bashrc
You can add/copy your private aliases and settings to `~/.private_bashrc`.

#### Wallpaper
Copy your favorite wallpaper to `~/media/images/wallpapers/current.jpg`, it will be set at startup.

## Troubleshooting

#### /boot is full
This is caused by mounting EFI partition created by Windows (it's size is around 100MB) as `/boot`. The EFI parition should be mounted to `/efi`, otherwise Linux kernel image will fill up the space quickly.

#### X.org does not start or no login prompt
This is most likely caused by some issue with video driver. Make sure drivers for your GPU are installed. Sometimes following actions help:
* reboot
* plug monitor to another output (if available)
* switch to other virtual terminal (using e.g. `Ctrl+Alt+F2`) and then back

#### Screen is tearing
The symptoms are visible horizontal lines on fast moving objects (e.g. in a video). The solution, currently for nVidia only, is to switch on **X Server Display Configuration -> Advanced -> Force Full Composition Pipeline** in nVidia GUI config. To make effect permanent, let nVidia GUI config write values into file and copy it to `/etc/X11/xorg.conf.d/20-nvidia.conf`.
