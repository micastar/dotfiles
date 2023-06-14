#!/usr/bin/sh

set -e

ip link add link wlan0 dev macvlan0-host type macvlan mode bridge

ip link set dev macvlan0-host up

ip addr add 192.168.1.230/24 dev macvlan0-host

# ip route add 172.45.0.02 dev macvlan0-host  
# ip route add 10.0.0.193 dev macvlan0-host










