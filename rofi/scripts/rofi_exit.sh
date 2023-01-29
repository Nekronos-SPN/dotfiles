#!/usr/bin/env bash

## Author : Aditya Shakya (adi1090x)
## Github : @adi1090x
#
## Rofi   : Power Menu
#
## Available Styles
#
## style-1   style-2   style-3   style-4   style-5
## style-6   style-7   style-8   style-9   style-10

# Current Theme
dir="$HOME/.config/rofi/powermenu/type-2"
theme='style-1'

# CMDs
uptime="`uptime -p | sed -e 's/up //g'`"
host=`hostname`

# Options
shutdown=''
reboot=''
lock=''
hibernate=''
sleep='鈴'
logout=''

# Rofi CMD
rofi_cmd() {
	rofi -dmenu \
		-theme ${dir}/${theme}.rasi
}

# Pass variables to rofi dmenu
run_rofi() {
	echo -e "$lock\n$sleep\n$hibernate\n$logout\n$reboot\n$shutdown" | rofi_cmd
}

# Actions
chosen="$(run_rofi)"
case ${chosen} in
    $hibernate)

                bash ~/.config/i3/scripts/lock_screen.sh
	    	systemctl hibernate	
	;;
    $shutdown)
		systemctl poweroff 
        ;;
    $reboot)
		systemctl reboot
        ;;
    $lock)
                bash ~/.config/i3/scripts/lock_screen.sh
        ;;
    $sleep)
                bash ~/.config/i3/scripts/lock_screen.sh
		systemctl suspend
        ;;
    $logout)
	    	i3-msg exit
        ;;
esac
