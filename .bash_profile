#
# ~/.bash_profile
#

[[ -f ~/.bashrc ]] && . ~/.bashrc

# Enable NUM lock
setleds -D +num

# Replacement for login manager
# Autostart Xfce when logging from tty1

if [ "$(tty)" = "/dev/tty1" ] ; then
  startx
fi
