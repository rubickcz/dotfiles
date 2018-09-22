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

###############################################
# Custom HW related stuff
###############################################

# disable PC speaker beeping
xset -b

# Stuff related to golem machine (desktop pc)
if [ "$HOSTNAME" = golem ]; then
    # set mouse sensitivity & acceleration
    xinput set-prop 13 269 1.5
    xset m 3 1

    # disable second monitor (VGA) if main monitor (HDMI) is connected
    xrandr | grep "HDMI1 connected" > /dev/null
    if [ $? -eq 0 ]; then
        xrandr --output DP1 --off
        xrandr --output HDMI1 --primary
    fi
fi

# Stuff related to marshadow machine (Dell E6400 laptop)
if [ "$HOSTNAME" = marshadow ]; then
    # disable HDD power management (causes clicking sounds)
    sudo hdparm -B 254 /dev/sda
fi

if [ "$HOSTNAME" = guzzlord ]; then
    # touchpad configuration
    xinput set-prop "SYNA7DB5:01 06CB:7DB7 Touchpad" "libinput Tapping Enabled" 1
    xinput set-prop "SYNA7DB5:01 06CB:7DB7 Touchpad" "libinput Accel Speed" 0.5

    # Connect IT CI-1225 mouse configuration
    xinput set-prop "2.4G Wireless Optical Mouse" "libinput Accel Speed" 0.2

    xrandr --setprovideroutputsource modesetting NVIDIA-0
    xrandr --auto
fi

if [ "$HOSTNAME" = lumineon ]; then
    # touchpad configuration
    xinput set-prop "SynPS/2 Synaptics TouchPad" "libinput Tapping Enabled" 1
fi

###############################################
# Start window manager
###############################################

exec i3
