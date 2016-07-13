#!/bin/bash
echo
if [ ! -f apt_updated ]; then
    echo "Do apt-get update.."
    echo
    touch apt_updated
    apt-get update
fi
echo "Do apt-get install .."
echo
apt-get -y install ssh wget 
cp /app/nginx.conf /etc/nginx/
ssh -nNT -L $INNER_PORT:$TARGET_INNER_IP:$TARGET_INNER_PORT $TARGET_ACC@$TARGET_IP &
nginx -g "daemon off;"

