#!/bin/sh

# Terminate already running bar instances
# killall -q i3lock
if pgrep -x swaylock;
then echo ;
else
# Wait until the processes have been shut down
# while pgrep -u $UID -x i3lock >/dev/null; do sleep 1; done

# betterlockscreen -l --fx dimblur -u ~/.wallpaper/lockbac/lock-one.jpg -q true
betterlockscreen -l --fx dimblur -q true

fi

# BLANK='#EAEAEF'
# CLEAR='#1e90ff'
# DEFAULT='#1e90ff'
# TEXT='#483d8b'
# WRONG='#ffa500'
# VERIFYING='#B5E6B5'

# i3lock \
# --insidever-color=$CLEAR     \
# --ringver-color=$VERIFYING   \
# \
# --insidewrong-color=$CLEAR   \
# --ringwrong-color=$WRONG     \
# \
# --inside-color=$BLANK        \
# --ring-color=$DEFAULT        \
# --line-color=$BLANK          \
# --separator-color=$DEFAULT   \
# \
# --verif-color=$TEXT          \
# --wrong-color=$TEXT          \
# --time-color=$TEXT           \
# --date-color=$TEXT           \
# --layout-color=$TEXT         \
# --keyhl-color=$WRONG         \
# --bshl-color=$WRONG          \
# \
# --screen 1                   \
# --blur 5                     \
# --clock                      \
# --indicator                  \
# --time-str="%H:%M:%S"        \
# --date-str="%A, %m %Y"       \
# --keylayout 1                \
