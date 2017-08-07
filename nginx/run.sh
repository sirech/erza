#!/usr/bin/env bash
envsubst '$$HOST' < /tmp/main.conf.template > /etc/nginx/sites-enabled/main.conf
envsubst '$$SHELF2_HOST' < /tmp/shelf2.conf.template > /etc/nginx/sites-enabled/shelf2.conf

nginx -g 'daemon off;'
