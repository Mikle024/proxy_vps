tr -d '\r' < config.toml.tmp > config.toml.clean
sed -i 's/\r//' .env

export $(xargs < .env)

envsubst '$PUBLIC_HOST $MY_SECRET $DASHA_SECRET $MAX_BER_SECRET' < config.toml.clean > config.toml

rm config.toml.clean