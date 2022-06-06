#!/bin/env

set -e

tag_name=`wget -qO- --no-check-certificate "https://api.github.com/repos/XTLS/Xray-core/releases/latest" | grep "tag_name"  | awk -F ":" '{print $2}' | sed 's/\"//g;s/,//g;s/ //g'`

wget --no-check-certificate https://github.com/XTLS/Xray-core/releases/download/$tag_name/Xray-linux-64.zip

sleep 2

ex Xray-linux-64.zip

sleep 2

rm -rf geoip.dat geosite.dat LICENSE README.md Xray-linux-64.zip
