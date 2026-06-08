#!/bin/bash

set -euo pipefail

if [ -f .env ]; then
    sed -i 's/\r//' .env
    export $(grep -v '^#' .env | xargs -d '\n')
else
    echo "Error: .env file not found!" >&2
    exit 1
fi

if [ -f config.toml.tmp ]; then
    tr -d '\r' < config.toml.tmp | envsubst '$PUBLIC_HOST $MY_SECRET $DASHA_SECRET $MAX_BER_SECRET' > config.toml
    echo "config.toml has been successfully generated!"
else
    echo "Error: config.toml.tmp not found!" >&2
    exit 1
fi