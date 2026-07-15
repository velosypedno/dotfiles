#!/usr/bin/env sh

if pgrep -x "rofi" > /dev/null; then
    pkill -x "rofi"
    exit 0
fi

chosen=$(printf "󰌾 Lock\n󰍃 Logout\n󰐥 Shutdown\n󰒲 Hibernate\n󰑓 Reboot" | rofi -dmenu -theme ~/.config/rofi/powermenu.rasi)

case "$chosen" in
    *Lock*)
        swaylock
        ;;
    *Logout*)
        loginctl terminate-user "$USER"
        ;;
    *Shutdown*)
        systemctl poweroff
        ;;
    *Hibernate*)
        systemctl hibernate
        ;;
    *Reboot*)
        systemctl reboot
        ;;
esac
