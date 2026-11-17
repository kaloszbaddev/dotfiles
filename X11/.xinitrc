#!/usr/bin/env bash
[[ -f ~/.Xresources ]] && xrdb -merge ~/.Xresources
export CURR_WALLPAPER="$HOME/images/wallpaper1.jpg"
exec i3
