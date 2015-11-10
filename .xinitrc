#!/bin/sh
#
# ~/.xinitrc
#
# Executed by startx (run your window manager from here)

if [ -d /etc/X11/xinit/xinitrc.d ]; then
  for f in /etc/X11/xinit/xinitrc.d/*; do
    [ -x "$f" ] && . "$f"
  done
  unset f
fi

# exec gnome-session
# exec startkde
# exec startxfce4
# ...or the Window Manager of your choice

# Allow keyboard layout change (change with alt-shift)
# setxkbmap -layout cz,us -option grp:alt_shift_toggle &

# Dirty hack to get automount notifications
# (killall devmon; sleep 5; devmon --exec-on-drive "notify-send -t 5000 \"Device %f %l has been automounted\"" --exec-on-unmount "notify-send -t 5000 \"Device %f %l has been unmounted\"" --exec-on-remove  "notify-send -t 5000 \"Device %f has been REMOVED\"") &

# Launch i3
exec i3
# exec gnome-session-cinnamon
