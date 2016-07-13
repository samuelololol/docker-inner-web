#!/bin/bash
echo
cd /
if [ ! -f provision ]; then
    echo "Do apt-get update.."
    echo
    touch provision
    echo "Do apt-get install .."
    apt-get update
    apt-get -y install ssh wget 
    echo "apt-get install done"
fi
cp /app/nginx.conf /etc/nginx/
echo "[docker]prepare to tunnel"
echo "[docker]ssh -nNT -L "$INNER_PORT:$TARGET_INNER_IP:$TARGET_INNER_PORT $TARGET_ACC@$TARGET_IP
ssh -nNT -L $INNER_PORT:$TARGET_INNER_IP:$TARGET_INNER_PORT $TARGET_ACC@$TARGET_IP &
echo "[docker]tunnel"
sed -i "s/EXPOSE_PORT/${EXPOSE_PORT}/" /etc/nginx/nginx.conf
sed -i "s/INNER_PORT/${INNER_PORT}/" /etc/nginx/nginx.conf
echo "[docker]start nginx ..."
nginx -g "daemon off;"

