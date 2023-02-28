#!/usr/bin/sh

set -e

cd ~/.config/clash/dnsmasq-china-list

git pull

make SERVER=domestic smartdns

