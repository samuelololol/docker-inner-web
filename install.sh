#!/bin/bash
cp /app/nginx.conf /etc/nginx/
echo "[docker]prepare to tunnel"
echo "[docker]ssh -oStrictHostKeyChecking=no -i /ssh/id_rsa -nNT -L "$INNER_PORT:$TARGET_INNER_IP:$TARGET_INNER_PORT $TARGET_ACC@$TARGET_IP
ssh -oStrictHostKeyChecking=no -i /ssh/id_rsa -nNT -L $INNER_PORT:$TARGET_INNER_IP:$TARGET_INNER_PORT $TARGET_ACC@$TARGET_IP &
echo "[docker]tunnel"
sed -i "s/EXPOSE_PORT/${EXPOSE_PORT}/" /etc/nginx/nginx.conf
sed -i "s/INNER_PORT/${INNER_PORT}/" /etc/nginx/nginx.conf
echo "[docker]start nginx ..."
nginx -g "daemon off;"

