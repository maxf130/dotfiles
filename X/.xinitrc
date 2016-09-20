#!/bin/bash
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


# Load .Xresources
xrdb -merge ~/.Xresources &> /dev/null

setxkbmap gb


# Set java font option
export _JAVA_OPTIONS="-Dawt.useSystemAAFontSettings=on"

feh --bg-scale ~/Pictures/background.jpg&

xset -b

exec /usr/bin/ratpoison
