#!/bin/sh

# start some nice programs
if [ -d /etc/X11/xinit/xinitrc.d ] ; then
 for f in /etc/X11/xinit/xinitrc.d/?*.sh ; do
  [ -x "$f" ] && . "$f"
 done
 unset f
fi

xrdb -merge $HOME/.Xresources.d/xterm
xrdb -merge $HOME/.Xresources.d/xterm-color-theme

xbindkeys

# setup displays
xrandr --output LVDS-1 --auto --output HDMI-1 --auto --above LVDS-1

exec stumpwm
