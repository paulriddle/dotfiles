setxkbmap -layout us,ru -option grp:alt_shift_toggle; xmodmap ~/.Xmodmap
redshift -l 56.8:60.6 -t 5700:3600 -g 0.8 -m randr &
xrandr --output VGA-1 --auto --left-of HDMI-1
exec i3
