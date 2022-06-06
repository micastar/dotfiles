#!/bin/env

set -e

tag_name=`wget -qO- --no-check-certificate  "https://api.github.com/repos/Loyalsoldier/v2ray-rules-dat/releases/latest" | grep "tag_name"  | awk -F ":" '{print $2}' | sed 's/\"//g;s/,//g;s/ //g'`

wget -i --no-check-certificate https://github.com/Loyalsoldier/v2ray-rules-dat/releases/download/$tag_name/geoip.dat https://github.com/Loyalsoldier/v2ray-rules-dat/releases/download/$tag_name/geosite.dat

sleep 2

if [ -f geoip.dat.1 ]
then
        mv geoip.dat.1 geoip.dat
else
        echo "geoip.dat.1 no exist"
	exit 1
fi

if [ -f geisite.dat.1 ]
then
        mv geosite.dat.1 geosite.dat
else
        echo "geosite.dat.1 no exist"
	exit 1
fi

sleep 2

tag=`docker ps | grep "mzz2017/v2raya" | awk '{print $1}'`

if [ -z $tag ]
then
        echo "docker ps no exist!"
	exit 1
else
        docker cp geoip.dat $tag:/root/.local/share/xray
        docker cp geosite.dat $tag:/root/.local/share/xray
fi

