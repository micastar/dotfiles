#!/bin/sh

if pgrep -x swaylock;
then echo ; 
else
	# ~/.config/waybar/scripts/lock.sh; 

	# Terminate already running bar instances
# killall -q swaylock

# Wait until the processes have been shut down
# while pgrep -u $UID -x swaylock >/dev/null; do sleep 1; done

swaylock \
	-f \
	--screenshots \
	--clock \
	--indicator \
	--indicator-radius 100 \
	--indicator-thickness 7 \
	--effect-blur 7x5 \
	--effect-vignette 0.5:0.5 \
	--ring-color bb00cc \
	--key-hl-color 880033 \
	--line-color 00000000 \
	--inside-color 00000088 \
	--separator-color 00000000 \
	--fade-in 0.8

fi

