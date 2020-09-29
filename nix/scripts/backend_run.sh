#!/usr/bin/env nix-shell
#!nix-shell -i /bin/sh -p cargo-watch

TOP_DIR="$(dirname $(readlink -f $0))"

while [ ! -f $TOP_DIR/Makefile ]; do
    TOP_DIR=$(dirname $TOP_DIR)
done

cd $TOP_DIR
cargo watch \
    --ignore assets \
    --ignore backend/static \
    --ignore frontend \
    --ignore nix \
    --ignore static \
    -x "run -p webapp-backend"
