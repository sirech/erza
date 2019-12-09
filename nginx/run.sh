#!/usr/bin/env ash

gomplate \
    -t acme-challenge=/tmp/fragments/acme-challenge.t \
    --input-dir /tmp/templates \
    --output-map='/etc/nginx/sites-enabled/{{ .in | strings.ReplaceAll ".conf.tmpl" ".conf" }}'
nginx -g 'daemon off;'
