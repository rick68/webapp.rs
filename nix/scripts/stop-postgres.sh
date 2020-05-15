#! /usr/bin/env nix-shell
#! nix-shell -i /bin/sh -p gnumake docker diesel-cli

TOP_DIR="$(dirname $(readlink -f $0))"

while [ ! -f $TOP_DIR/Makefile ]; do
    TOP_DIR=$(dirname $TOP_DIR)
done

make -C $TOP_DIR CONTAINER_RUNTIME=docker stop-postgres
