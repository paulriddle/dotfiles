#!/bin/sh

if [ -d /etc/X11/xinit/xinitrc.d ]; then
    for f in /etc/X11/xinit/xinitrc.d/*; do
        [ -x "$f" ] && . "$f"
    done
    unset f
fi

xrdb -load ~/.Xresources
# xset +fp /usr/share/fonts/local
xset fp rehash
xmodmap ~/.Xmodmap &
# feh --bg-fill ~/pictures/Archlinux.png &
./xflux -l 58 -g 56.3 &
sxhkd &
urxvt &
# exec bspwm
