#!/bin/bash

set -e

GREEN='\033[0;32m'
NC='\033[0m'

cd ~/.config/clash/

mkdir -p ./tmp

cd tmp

# tag_name=`curl -sSL "https://api.github.com/repos/keunghin/geoip/releases/latest" | grep "tag_name"  | awk -F ":" '{print $2}' | sed 's/\"//g;s/,//g;s/ //g'`

# curl -Lo Country.mmdb "https://cdn.jsdelivr.net/gh/keunghin/geoip@release/Country.mmdb"

# curl -C -o Country.mmdb "https://github.com/Loyalsoldier/geoip/releases/latest/download/Country-asn.mmdb" \
# -o Country-asn.mmdb.sha256sum "https://github.com/Loyalsoldier/geoip/releases/latest/download/Country-asn.mmdb.sha256sum"

# curl -Lo Country.mmdb "https://github.com/Loyalsoldier/geoip/releases/latest/download/Country-only-cn-private.mmdb" \
# -Lo Country-asn.mmdb.sha256sum "https://github.com/Loyalsoldier/geoip/releases/latest/download/Country-only-cn-private.mmdb.sha256sum"

curl -Lo Country.mmdb "https://cdn.jsdelivr.net/gh/Hackl0us/GeoIP2-CN@release/Country.mmdb" \

# curl -o Country-asn.mmdb.sha256sum "https://github.com/Loyalsoldier/geoip/releases/latest/download/Country-asn.mmdb.sha256sum"


# echo "$(cat Country-only-cn-private.mmdb.sha256sum | awk '{ print $1 }') Country.mmdb" | sha256sum -c | awk '{ print $2 }'

# sum=`echo "$(cat Country-asn.mmdb.sha256sum | awk '{ print $1 }') Country.mmdb" | sha256sum -c | awk '{ print $2 }'`

# if [ "OK" = $sum ]
# then
mv Country.mmdb ../Country.mmdb

cd ..

rm -rf ./tmp

echo -e "${GREEN}complete${NC}"

        # sleep 1

        # tag=`docker ps | grep "dreamacro/clash-premium:latest" | awk '{print $1}'`
        # tag=`docker ps -aqf "ancestor=dreamacro/clash-premium:latest"`

        # if [ -z $tag ]
        # then
                # printf "\e[0;31m docker ps no exist \e[0m\n"
                # exit 1
        # else
                # docker-compose restart
                # printf "\e[0;32m Done! \e[0m\n"
        # fi

        # echo -e "${GREEN}complete${NC}"
        
# else
#         echo -e "${GREEN}something error${NC}"
#         exit 1
# fi
