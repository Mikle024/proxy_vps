#!/bin/bash

set -euo pipefail

if [ -f .env ]; then
    sed -i 's/\r//' .env
    export $(grep -v '^#' .env | xargs -d '\n')
else
    echo "Error: .env file not found!" >&2
    exit 1
fi

if [ -f config.json.tmp ]; then
    tr -d '\r' < config.json.tmp | envsubst '$SERVER_ADDRESS $ID $FAKE_DOMAIN $BROWSER_FINGERPRINT \
      $PUBLIC_KEY $SHORT_ID' > config.json
    echo "config.json has been successfully generated!"
else
    echo "Error: config.json.tmp not found!" >&2
    exit 1
fi