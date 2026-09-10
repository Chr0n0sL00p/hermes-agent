#!/bin/sh
# start.sh — Arranque compatible con Render Free Tier
# El gateway de Telegram corre en segundo plano
/opt/hermes/bin/hermes gateway run &
# Esperamos a que se conecte
sleep 5
# Exponemos un puerto HTTP mínimo que Render puede detectar
# Usamos el puerto que Render nos asigna vía environment variable
exec python3 -m http.server ${PORT:-10000} --bind 0.0.0.0
