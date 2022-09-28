#!/usr/bin/env bash

# Terminate already running bar instances
killall -q xidlehook

# Wait until the processes have been shut down
while pgrep -u $UID -x xidlehook >/dev/null; do sleep 1; done

export PRIMARY_DISPLAY="$(xrandr | grep "eDP-1-1" | awk '{print $1}')"

# Run xidlehook
xidlehook \
  `# Don't lock when there's a fullscreen application` \
  --not-when-fullscreen \
  `# Don't lock when there's audio playing` \
  --not-when-audio \
  `# Dim the screen after 60 seconds, undim if user becomes active` \
  --timer 1200 \
    'if pgrep -x i3lock; then echo ; else ~/.config/polybar/scripts/lock.sh; fi' '' \
  `# Finally, suspend an hour after it locks` \
  --timer 43200 \
    'if pgrep -x i3lock; then systemctl suspend; fi' '' \
  # `# Dim the screen after 60 seconds, undim if user becomes active` \
  # --timer 900 \
  #   'xrandr --output "$PRIMARY_DISPLAY" --brightness .1' \
  #   'xrandr --output "$PRIMARY_DISPLAY" --brightness 1' \
