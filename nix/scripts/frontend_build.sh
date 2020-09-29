#!/usr/bin/env nix-shell
#!nix-shell -i /bin/sh -p wasm-pack nodePackages.rollup

set -e

TOP_DIR="$(dirname $(readlink -f $0))"

while [ ! -f $TOP_DIR/Makefile ]; do
    TOP_DIR=$(dirname $TOP_DIR)
done

(cd $TOP_DIR/frontend && wasm-pack build --no-typescript --target web)

rollup $TOP_DIR/frontend/main.js --format iife --file $TOP_DIR/frontend/pkg/webapp_frontend.js
