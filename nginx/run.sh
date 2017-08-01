#!/usr/bin/env bash
envsubst '$SHELF_HOST' < /tmp/shelf.conf.template > /etc/nginx/sites-enabled/shelf.conf

nginx -g 'daemon off;'
