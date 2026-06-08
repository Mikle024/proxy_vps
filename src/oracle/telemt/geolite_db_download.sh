#!/bin/bash

set -e

DIR="geoip"
mkdir -p "$DIR"

echo "Downloading latest GeoIP databases..."

if curl -L -f -s https://github.com/P3TERX/GeoLite.mmdb/releases/latest/download/GeoLite2-City.mmdb -o "$DIR/GeoLite2-City.mmdb.tmp" && \
   curl -L -f -s https://github.com/P3TERX/GeoLite.mmdb/releases/latest/download/GeoLite2-ASN.mmdb -o "$DIR/GeoLite2-ASN.mmdb.tmp"; then

    mv "$DIR/GeoLite2-City.mmdb.tmp" "$DIR/GeoLite2-City.mmdb"
    mv "$DIR/GeoLite2-ASN.mmdb.tmp" "$DIR/GeoLite2-ASN.mmdb"

    echo "GeoIP databases have been successfully updated!"
else
    echo "Error: Failed to download databases. Old files preserved."
    rm -f "$DIR"/*.tmp
    exit 1
fi
