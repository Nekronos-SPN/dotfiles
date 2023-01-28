#!/bin/sh
bash ~/.config/i3/scripts/get-colors.sh
picom -CGb
spotify-listener & disown
bash ~/.config/polybar/launch.sh
