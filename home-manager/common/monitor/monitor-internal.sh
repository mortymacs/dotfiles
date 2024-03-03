#!/bin/sh

INTERNAL_MONITOR=$(xrandr | \grep primary | cut -d' ' -f1)
INTERNAL_MONITOR_RESOLUTION=$(xrandr | \grep -A15 primary | \grep '59.99    59.98' | cut -d' ' -f4)
if [ -z "$INTERNAL_MONITOR_RESOLUTION"  ]; then
    INTERNAL_MONITOR_RESOLUTION=$(xrandr | \grep -A1 primary | tail -1 | cut -d' '  -f4)
fi
EXTERNAL_MONITOR=$(xrandr | \grep ' connected' | tail -1 | cut -d' ' -f1)
xrandr --output "$INTERNAL_MONITOR" --primary --mode "$INTERNAL_MONITOR_RESOLUTION" --output "$EXTERNAL_MONITOR" --off

bspc monitor "$INTERNAL_MONITOR" --rectangle "$INTERNAL_MONITOR_RESOLUTION"+0+0
bspc config bottom_padding 0
bspc config right_padding 0

feh --bg-fill ~/.config/bspwm/wallpaper.jpg
polybar-msg cmd restart
