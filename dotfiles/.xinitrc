###############################################
## Default stuff
################################################

userresources=$HOME/.Xresources
usermodmap=$HOME/.Xmodmap
sysresources=/etc/X11/xinit/.Xresources
sysmodmap=/etc/X11/xinit/.Xmodmap

# merge in defaults and keymaps

if [ -f $sysresources ]; then
    xrdb -merge $sysresources
fi

if [ -f $sysmodmap ]; then
    xmodmap $sysmodmap
fi

if [ -f "$userresources" ]; then
    xrdb -merge "$userresources"
fi

if [ -f "$usermodmap" ]; then
    xmodmap "$usermodmap"
fi

# start some nice programs

if [ -d /etc/X11/xinit/xinitrc.d ] ; then
 for f in /etc/X11/xinit/xinitrc.d/?*.sh ; do
  [ -x "$f" ] && . "$f"
 done
 unset f
fi

###############################################
# Custom stuff
###############################################

# start devmon here, not via systemd (notify-send was not working)
devmon \
--exec-on-drive "notify-send \"Automount\" \"Device %f has been mounted as %l.\"" \
--exec-on-unmount "notify-send \"Automount\" \"Device %f has been unmounted.\"" \
&

# start ssh agent
eval $(ssh-agent)

# disable PC speaker beeping
xset -b

# Make mouse quicker
xinput set-prop "2.4G Wireless Optical Mouse" "libinput Accel Speed" 1
xinput set-prop "A4Tech PS/2+USB Mouse" "libinput Accel Speed" 1
xinput set-prop "pointer:Logitech MX Master 2S" "libinput Accel Speed" 1
xinput set-prop "pointer:Logitech MX Master 2S" "libinput High Resolution Wheel Scroll Enabled" 0

if [ "$HOSTNAME" = golem ]; then
    # 4K monitor tweaks
    export GDK_SCALE=2
fi

if [ "$HOSTNAME" = guzzlord ]; then
    # touchpad configuration
    xinput set-prop "SYNA7DB5:01 06CB:7DB7 Touchpad" "libinput Tapping Enabled" 1
    xinput set-prop "SYNA7DB5:01 06CB:7DB7 Touchpad" "libinput Accel Speed" 0.5

    xrandr --setprovideroutputsource modesetting NVIDIA-0
    xrandr --auto
fi

if [ "$HOSTNAME" = lumineon ]; then
    # touchpad configuration
    xinput set-prop "SynPS/2 Synaptics TouchPad" "libinput Tapping Enabled" 1
    xinput set-prop "SynPS/2 Synaptics TouchPad" "libinput Accel Speed" 0.35
fi

if [ "$HOSTNAME" = devil ]; then
    # set correct primary screen
    (sleep 3; xrandr --output eDP-1 --primary || xrandr --output eDP1 --primary) &
    # touchpad configuration
    xinput set-prop "MSFT0001:01 04F3:3247 Touchpad" "libinput Tapping Enabled" 1
    xinput set-prop "MSFT0001:01 04F3:3247 Touchpad" "libinput Accel Speed" 0.35
fi

# start window manager
exec i3
