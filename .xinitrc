#!/bin/sh

userresources=$HOME/.Xresources
usermodmap=$HOME/.Xmodmap
sysresources=/etc/X11/xinit/.Xresources
sysmodmap=/etc/X11/xinit/.Xmodmap

# merge in defaults and keymaps

if [ -f $sysresources ]; then







    xrdb -merge $sysresources
		~/.fehbg

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

# Display Resolution (I add this in)
xrandr --output Virtual-1 --mode 1360x768 & 

# Statusbar loop (I added this in)
while true; do
	xsetroot -name "$( date +"%F %R" )"
	sleep 1m # Update time every minute
done &

exec dwm



while true; do
	dwm >/dev/null 2>&1
done

# Background 
sudo feh --bg-scale ~/wallpapers/0122.jpg

# Settable options
set -o vi

# Start X server
startx
