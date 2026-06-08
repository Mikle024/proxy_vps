#!/bin/bash

set -euo pipefail

if [ -f .env ]; then
    sed -i 's/\r//' .env
    export $(grep -v '^#' .env | xargs -d '\n')
else
    echo "Error: .env file not found!" >&2
    exit 1
fi

if [ -f panel.toml.tmp ]; then
    tr -d '\r' < panel.toml.tmp | envsubst '$ADMIN_USERNAME $ADMIN_PASSWORD_HASH $ADMIN_JWT_SECRET' > panel.toml
    echo "panel.toml has been successfully generated!"
else
    echo "Error: panel.toml.tmp not found!" >&2
    exit 1
fi