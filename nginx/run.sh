#!/usr/bin/env bash
envsubst '$$HOST' < /tmp/main.conf.template > /etc/nginx/sites-enabled/main.conf
envsubst '$$HOST' < /tmp/images.conf.template > /etc/nginx/sites-enabled/images.conf
envsubst '$$SHELF2_HOST' < /tmp/shelf2.conf.template > /etc/nginx/sites-enabled/shelf2.conf
envsubst '$$ECHO_HOST' < /tmp/echo.conf.template > /etc/nginx/sites-enabled/echo.conf

nginx -g 'daemon off;'
