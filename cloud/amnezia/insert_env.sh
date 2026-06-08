#!/bin/bash

tr -d '\r' < awg0.conf.tmp > awg0.conf.clean
sed -i 's/\r//' .env

export $(xargs < .env)

envsubst '$PRIVATE_KEY_A_SERV $PUBLIC_KEY_B_SERV' < awg0.conf.clean > awg0.conf

rm awg0.conf.clean