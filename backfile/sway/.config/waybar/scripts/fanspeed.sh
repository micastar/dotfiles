#!/bin/env bash

n=`cat /sys/devices/platform/asus-nb-wmi/fan_boost_mode`

case $n in
0)
    echo "$n Normal Mode";;
1)
    echo "$n Performance Mode";;
2)
    echo "$n Silent Mode";;
esac
