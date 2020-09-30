{ nixpkgs ? <nixpkgs>
, pkgs ? (import nixpkgs {})
, stdenv ? pkgs.stdenv
, lib ? stdenv.lib
, runCommandLocal ? pkgs.runCommandLocal
, callPackage ? pkgs.callPackage
, moz_overlay ? (import (builtins.fetchTarball
  "https://github.com/mozilla/nixpkgs-mozilla/archive/master.tar.gz"))
, moz_nixpkgs ? (import nixpkgs { overlays = [ moz_overlay ]; })
, date ? null
, channel ? "nightly"
, rustChannel ? moz_nixpkgs.rustChannelOf { inherit date channel; }
, webappName ? builtins.readFile (runCommandLocal "project-name"
  { CARGO_TOML = builtins.readFile ./Cargo.toml; } ''
    echo "$CARGO_TOML" | sed -n -e 's/^name = "\(.*\)"$/\1/p' | head -1 | tr -d '\n' > $out
  '')
, webappVersion ? builtins.readFile (runCommandLocal "project-version"
  { CARGO_TOML = builtins.readFile ./Cargo.toml; } ''
    echo "$CARGO_TOML" | sed -n -e 's/^version = "\(.*\)"$/\1/p' | head -1 | tr -d '\n' > $out
  '')
, webappSrc ? callPackage ./nix/source.nix { inherit webappName webappVersion; }
} @ args:

let
  frontend = import ./nix/frontend.nix args;
  backend = import ./nix/backend.nix args;

  rollup = callPackage ./nix/rollup {};
  terser = callPackage ./nix/terser {};

in stdenv.mkDerivation {
  name = "${webappName}-${webappVersion}";
  version = webappVersion;
  src = webappSrc;

  nativeBuildInputs = [ rollup terser ] ++
    (with pkgs; [ binaryen makeWrapper ]);

  buildCommand = ''
    mkdir $out
    cp -r ${backend}/* $out
    chmod -R +w $out

    wrapProgram $out/bin/backend --run "cd $out"

    cp -R ${frontend}/static $out
    chmod -R +w $out/static

    name=${lib.replaceStrings [ "-" ] [ "_" ] frontend.pname}

    mkdir -p $out/static/pkg
    wasm-opt -Oz -o $out/static/pkg/''${name}_bg.wasm ${frontend}/pkg/''${name}_bg.wasm

    cp -R ${frontend}/pkg .
    rollup ./main.js --format iife --file $out/static/pkg/$name.js

    terser --compress --mangle \
        -- $out/static/pkg/$name.js \
        > $name.min.js
    mv $name.min.js $out/static/pkg/$name.js
  '';
}
