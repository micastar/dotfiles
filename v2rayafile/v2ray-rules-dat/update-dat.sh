#!/bin/env sh

set -e

# V2RAY_DIR="./"

GREEN='\033[0;32m'
NC='\033[0m'

GEOIP_URL="https://cdn.jsdelivr.net/gh/Loyalsoldier/v2ray-rules-dat@release/geoip.dat"
GEOSITE_URL="https://cdn.jsdelivr.net/gh/Loyalsoldier/v2ray-rules-dat@release/geosite.dat"

# echo -e "${GREEN}>>> change directory...${NC}"
# cd $V2RAY_DIR

echo -e "${GREEN}>>> downloading geoip.dat files...${NC}"
curl -L -o geoip.dat.new $GEOIP_URL

echo -e "${GREEN}>>> downloading geosite.dat files...${NC}"
curl -L -o geosite.dat.new $GEOSITE_URL

echo -e "${GREEN}>>> delete old dat files...${NC}"
rm -f geoip.dat geosite.dat

mv geoip.dat.new geoip.dat
mv geosite.dat.new geosite.dat

echo -e "${GREEN}完成啦！${NC}"

sleep 2

tag=`docker ps | grep "mzz2017/v2raya" | awk '{print $1}'`

if [ -z $tag ]
then
        printf "\e[0;31m docker ps no exist \e[0m\n"
        exit 1
else
        docker cp geoip.dat $tag:/root/.local/share/xray
        docker cp geosite.dat $tag:/root/.local/share/xray

        printf "\e[0;32m Done! \e[0m\n"
fi
