#!/usr/bin/env nix-shell
#!nix-shell -i /bin/sh -p nodePackages.nodemon wasm-pack nodePackages.rollup

TOP_DIR="$(dirname $(readlink -f $0))"

while [ ! -f $TOP_DIR/Makefile ]; do
    TOP_DIR=$(dirname $TOP_DIR)
done

WATCH_DIRS="$TOP_DIR/frontend"
IGNORES="$TOP_DIR/frontend/pkg"
EXTENSIONS="toml rs"
DELAY=1

EXEC="/bin/sh -c"
APP="$TOP_DIR/nix/scripts/frontend_build.sh"
APP_ARGS=""

##
# $1 - option name
# $2 - argument list
#
function createItems()
{
    local OPTION=$1
    local LIST=$2
    local RESULT=""

    for i in $LIST; do
        if [ "x$RESULT" = "x" ]; then
            RESULT="$OPTION $i"
        else
            RESULT="$RESULT $OPTION $i"
        fi
    done

    echo $RESULT
}

WATCH_OPTION=$(createItems "--watch" "$WATCH_DIRS")
IGNORE_OPTION=$(createItems "--ignore" "$IGNORES")
EXTENSIONS_OPTION="-e "$(echo "$EXTENSIONS" | sed -e "s/[[:space:]]/,/g")

nodemon \
    $WATCH_OPTION \
    $IGNORE_OPTION \
    $EXTENSIONS_OPTION \
    --delay "$DELAY" \
    --exec "$EXEC" \
    "$APP" -- "$APP_ARGS"
