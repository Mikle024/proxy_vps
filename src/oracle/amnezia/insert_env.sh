#!/bin/bash

set -euo pipefail

if [ -f .env ]; then
    sed -i 's/\r//' .env
    export $(grep -v '^#' .env | xargs -d '\n')
else
    echo "Error: .env file not found!" >&2
    exit 1
fi

if [ -f awg0.conf.tmp ]; then
    tr -d '\r' < awg0.conf.tmp | envsubst '$PRIVATE_KEY_B_SERV $PUBLIC_KEY_A_SERV' > awg0.conf
    echo "awg0.conf has been successfully generated!"
else
    echo "Error: awg0.conf.tmp not found!" >&2
    exit 1
fi