tr -d '\r' < panel.toml.tmp > panel.toml.clean
sed -i 's/\r//' .env

export $(xargs < .env)

envsubst '$ADMIN_USERNAME $ADMIN_PASSWORD_HASH $ADMIN_JWT_SECRET' < panel.toml.clean > panel.toml

rm panel.toml.clean