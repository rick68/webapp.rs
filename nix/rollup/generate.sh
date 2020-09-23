#! /usr/bin/env nix-shell
#! nix-shell -i bash -p nodejs nodePackages.node2nix

NODEJS_VERSION=$(node --version | tr -d v | cut -f 1 -d .)

node2nix \
    --nodejs-$NODEJS_VERSION \
    -i pkgs.json \
    -c nodepkgs.nix
