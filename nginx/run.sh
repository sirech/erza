#!/usr/bin/env ash

gomplate --input-dir /tmp/templates --output-map='/etc/nginx/sites-enabled/{{ .in | strings.ReplaceAll ".conf.tmpl" ".conf" }}'
nginx -g 'daemon off;'
