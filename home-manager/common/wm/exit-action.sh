#!/bin/sh

action=$(echo -ne 'Exit\nRestart\nShutdown' | rofi -dmenu)
case $action in
    Exit)
        swaymsg exit
        ;;
    Restart)
        reboot
        ;;
    Shutdown)
        shutdown now
        ;;
esac
