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

feh --bg-scale ~/Pictures/background.jpg

exec qtile
