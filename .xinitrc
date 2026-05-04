#!/usr/bin/env zsh

feh --bg-scale ~/Wallpapers/win7-4k.jpg 

xrandr --output HDMI-A-0 --mode 1920x1080 --rate 180.0 
picom &

export XDG_CURRENT_DESKTOP=i3

exec i3 
