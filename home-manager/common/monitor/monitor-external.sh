#!/bin/sh

INTERNAL_MONITOR=$(xrandr | \grep primary | cut -d' ' -f1)
EXTERNAL_MONITOR=$(xrandr | \grep ' connected' | tail -1 | cut -d' ' -f1)
EXTERNAL_MONITOR_RESOLUTION=$(xrandr | \grep -A1 ' connected' | tail -1 | cut -d' ' -f4)
xrandr --output "$INTERNAL_MONITOR" --off --output "$EXTERNAL_MONITOR" --mode "$EXTERNAL_MONITOR_RESOLUTION"

bspc monitor "$EXTERNAL_MONITOR" --rectangle "$EXTERNAL_MONITOR_RESOLUTION"+0+0
bspc config bottom_padding 0
bspc config right_padding 0

feh --bg-fill ~/.config/bspwm/wallpaper.jpg
polybar-msg cmd restart
