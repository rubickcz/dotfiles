#
# ~/.bash_profile
#

[[ -f ~/.bashrc ]] && . ~/.bashrc

# Replacement for login manager
# Autostart Xorg when logging from tty1

if [ "$(tty)" = "/dev/tty1" ] ; then
  startx
fi
