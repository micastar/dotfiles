#!/bin/sh

# Terminate already running bar instances
killall -q swayidle

# Wait until the processes have been shut down
while pgrep -u $UID -x swayidle >/dev/null; do sleep 1; done

swayidle -w \
	timeout 1200 'if pgrep -x swaylock; then echo ; else ~/.config/waybar/scripts/lock.sh; fi' \
    timeout 1205 'if pgrep -x swaylock; then swaymsg "output * dpms off"; fi' \
    resume 'if pgrep -x swaylock; then swaymsg "output * dpms on"; fi' \
    timeout 43200 'if pgrep -x swaylock; then systemctl suspend; fi' 