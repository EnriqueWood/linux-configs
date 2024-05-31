#!/bin/bash

pkill -u ewood -f xfce4-notifyd
max_brightness=$(brightnessctl m)
current_brightness=$(brightnessctl g)
brightness_percentage=$(( 100 * current_brightness / max_brightness ))

if [ "$1" = "up" ]; then
    value="+10%"
elif [ "$1" = "down" ]; then
    if [ $brightness_percentage -le 14 ] && [ $brightness_percentage -ge 10 ]; then
        value=5
    elif [ $brightness_percentage -ge 5 ] && [ $brightness_percentage -le 9 ]; then
        value=3
    elif [ $brightness_percentage -gt 2 ] && [ $brightness_percentage -le 4 ]; then
        value=1
    else
        value="10%-"
    fi
fi
case "$1" in
    up)
        value="+10%"
        ;;
    down)
        if [ $brightness_percentage -le 14 ] && [ $brightness_percentage -ge 10 ]; then
            value=5
        elif [ $brightness_percentage -ge 5 ] && [ $brightness_percentage -le 9 ]; then
            value=3
        elif [ $brightness_percentage -gt 2 ] && [ $brightness_percentage -le 4 ]; then
            value=1
        else
            value="10%-"
        fi
        ;;
esac
brightnessctl set $value%


function asuser() {
    local display=":$(ls /tmp/.X11-unix/* | sed 's#/tmp/.X11-unix/X##' | head -n 1)"
    local user=$(who | grep '('$display')' | awk '{print $1}' | head -n 1)
    local uid=$(id -u $user)

    sudo -u $user DISPLAY=$display DBUS_SESSION_BUS_ADDRESS=unix:path=/run/user/$uid/bus "$@"
}
current_brightness=$(brightnessctl g)
brightness_percentage=$(( 100 * current_brightness / max_brightness ))
icon_path="/usr/share/icons/Adwaita/symbolic/status/display-brightness-symbolic.svg"
asuser notify-send -i $icon_path "$brightness_percentage%"
