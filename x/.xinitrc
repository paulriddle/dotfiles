setxkbmap -layout us,ru -option grp:alt_shift_toggle; xmodmap ~/.Xmodmap
xflux -l 56.85 -g 60.6
xrandr --output HDMI-1 --auto --left-of VGA-1
/usr/bin/dropbox &
exec i3
