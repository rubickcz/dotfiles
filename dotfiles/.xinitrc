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

# copy data between xorg's primary and clipboard selections
autocutsel -fork &
autocutsel -selection PRIMARY -fork &

###############################################
# Custom HW related stuff
###############################################

# disable PC speaker beeping
xset -b

# set mouse sensitivity & acceleration
xinput set-prop 13 269 1.5
xset m 3 1

# disable second monitor (VGA) if main monitor (HDMI) is connected
xrandr | grep "HDMI1 connected" > /dev/null
if [ $? -eq 0 ]; then
    xrandr --output DP1 --off
    xrandr --output HDMI1 --primary
fi

###############################################
# Start window manager
###############################################

exec i3