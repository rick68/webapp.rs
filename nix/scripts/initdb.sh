#! /usr/bin/env nix-shell
#! nix-shell -i /bin/sh -p postgresql diesel-cli

TOP_DIR="$(dirname $(readlink -f $0))"

while [ ! -f $TOP_DIR/Config.toml ]; do
    TOP_DIR=$(dirname $TOP_DIR)
done

CONFIG_TOML=$(<$TOP_DIR/Config.toml)
USERNAME=$(echo "$CONFIG_TOML" | sed -n -e 's/^username = "\(.*\)"$/\1/p')
PASSWORD=$(echo "$CONFIG_TOML" | sed -n -e 's/^password = "\(.*\)"$/\1/p')
DATABASE=$(echo "$CONFIG_TOML" | sed -n -e 's/^database = "\(.*\)"$/\1/p')
HOST="localhost"

sudo -u postgres psql \
    -X \
    -c "CREATE USER ${USERNAME} WITH REPLICATION PASSWORD '${PASSWORD}'" \
    -c "CREATE DATABASE ${DATABASE} OWNER ${USERNAME}" \
    -c "GRANT CONNECT ON DATABASE ${DATABASE} TO ${USERNAME}"

cd $TOP_DIR
diesel migration run \
    --database-url postgres://${USERNAME}:${PASSWORD}@${HOST}/${DATABASE}
