setxkbmap -layout us,ru -option grp:alt_shift_toggle; xmodmap ~/.Xmodmap
redshift -l 56.8:60.6 -t 5700:3600 -g 0.8 -m randr &
xrandr --output HDMI-1 --auto --left-of VGA-1
/usr/bin/dropbox &
exec i3
