#!/bin/sh
set -eu

: "${WHATSAPP_NUMBER:=971501234567}"

export WHATSAPP_NUMBER
envsubst '${WHATSAPP_NUMBER}' < /usr/share/nginx/html/index.template.html > /usr/share/nginx/html/index.html

exec nginx -g 'daemon off;'
