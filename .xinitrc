#!/bin/sh

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

# compositer
picom -f &</dev/null &

# nitrogen
nitrogen --restore &

# dwmbar 
while true; do
	MEM=$(free -h | awk '/^Mem:/ {print $3 "/" $2}')
	#NET=$(nmcli dev wifi | grep -E '^[*]' | awk '/*/ {print $8}')
	CPU=$(top -bn1 | grep "Cpu(s)" | sed "s/.*, *\([0-9.]*\)%* id.*/\1/" | awk '{print 100 - $1"%"}')
	xsetroot -name "$(date) | Mem:$MEM |  CPU: $CPU |"
	sleep 1s
done &

# dwmblocks
#exec dwmblocks&>/dev/null &

# Execute DWM
exec  dbus-launch dwm
