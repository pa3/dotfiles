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

exec stumpwm
