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


# Load .Xresources
[[ -f ~/.Xresources ]] && xrdb -merge ~/.Xresources

# Set caps lock as control to avoid emacs pinky
setxkbmap -option ctrl:nocaps

# Set java font option
export _JAVA_OPTIONS="-Dawt.useSystemAAFontSettings=on"




# exec gnome-session
# exec startkde
# exec startxfce4
# ...or the Window Manager of your choice
#exec i3
exec ck-launch-session dbus-launch --sh-syntax --exit-with-session qtile 
