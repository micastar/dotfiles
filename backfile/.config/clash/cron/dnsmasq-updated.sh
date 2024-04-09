#!/usr/bin/sh

set -e

cd ~/.config/clash/dnsmasq-china-list

/usr/bin/gg /usr/bin/git pull

make SERVER=domestic smartdns

