#!/usr/bin/env bash
envsubst '$$SHELF2_HOST' < /tmp/shelf2.conf.template > /etc/nginx/sites-enabled/shelf2.conf

nginx -g 'daemon off;'
