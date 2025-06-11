#!/bin/sh
exec ~/.config/dwm/dwm &
# Set wallpaper
feh --no-fehbg --bg-scale /home/dbochoa77/personal/Wallpapers/hannibalCrossingTheAlps.jpg &

# Start compositor
picom --config ~/.config/picom.conf 

