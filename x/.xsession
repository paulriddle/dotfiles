xrdb -load ~/.Xresources
# xset +fp /usr/share/fonts/local
# xset fp rehash
xmodmap ~/.Xmodmap &
# feh --bg-fill ~/pictures/Archlinux.png &
./xflux -l 58 -g 56.3 &
sxhkd &
urxvt &
bspwm
