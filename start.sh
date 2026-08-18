#!/bin/sh

set -e

mkdir -p /var/run/nut
chown -R nut:nut /var/run/nut

rm -f /var/run/nut/*

echo "Starting NUT..."

upsdrvctl -u root start

echo "Starting NUT server..."
upsd

echo "Starting NUT monitor..."
exec upsmon -F