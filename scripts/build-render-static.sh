#!/bin/sh
set -eu

WHATSAPP_NUMBER="${WHATSAPP_NUMBER:-971501234567}"

mkdir -p dist
sed "s|\$WHATSAPP_NUMBER|$WHATSAPP_NUMBER|g" index.render.template.html > dist/index.html
