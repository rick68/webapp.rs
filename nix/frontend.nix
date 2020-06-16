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
  { CARGO_TOML = builtins.readFile ../Cargo.toml; } ''
    echo "$CARGO_TOML" | sed -n -e 's/^name = "\(.*\)"$/\1/p' | head -1 | tr -d '\n' > $out
  '')
, webappVersion ? builtins.readFile (runCommandLocal "project-version"
  { CARGO_TOML = builtins.readFile ../Cargo.toml; } ''
    echo "$CARGO_TOML" | sed -n -e 's/^version = "\(.*\)"$/\1/p' | head -1 | tr -d '\n' > $out
  '')
, webappSrc ? callPackage ./source.nix { inherit webappName webappVersion; }
, cargoSha256 ? "1pwayph2abscxr6v54nqp9ps1kzzr302807krwna5r9bbiw2bqd6"
, uikit ? callPackage ./uikit {}
}:

let
  crateOverrides = pkgs.defaultCrateOverrides // {
    sass-sys = attrs: {
      buildInputs = with pkgs; [ git ];
    };
  };

  buildRustCrate = pkgs.buildRustCrate.override {
    defaultCrateOverrides = crateOverrides;
    rustc = (rustChannel.rust.override {
      targets = [ "wasm32-unknown-unknown" ];
    });
    cargo = rustChannel.cargo;
  };

  cargoDeps = pkgs.rustPlatform.fetchcargo {
    name = webappName;
    version = webappVersion;
    src = webappSrc;
    sha256 = cargoSha256;
    sourceRoot = null;
  };

  fake-git-for-clone-uikit = pkgs.writeShellScriptBin "git" ''
    OUT_DIR=$5
    mkdir -p $OUT_DIR
    cp -a ${uikit}/. $OUT_DIR
    chmod -R +w $OUT_DIR
  '';

in (import ../Cargo.nix {
  inherit pkgs lib stdenv;
  inherit buildRustCrate;
  defaultCrateOverrides = crateOverrides;
  rootFeatures = [ "default" ];
}).workspaceMembers.webapp-frontend.build.overrideAttrs (attrs: {
  buildInputs = attrs.buildInputs ++ [ fake-git-for-clone-uikit ]
    ++ (with pkgs; [ cargo-web ]);

  buildCommand = ''
    export HOME=$(mktemp -d)

    cp -a ${webappSrc}/. $NIX_BUILD_TOP
    chmod -R +w $NIX_BUILD_TOP

    unpackFile "${cargoDeps}"
    cargoDepsCopy=$(stripHash $(basename ${cargoDeps}))
    chmod -R +w "$cargoDepsCopy"

    mkdir .cargo
    config=${<nixpkgs/pkgs/build-support/rust/fetchcargo-default-config.toml>}
    substitute $config .cargo/config \
      --subst-var-by vendor "$(pwd)/$cargoDepsCopy"

    cargo web deploy --release -o $out/static -p webapp-frontend --target wasm32-unknown-unknown

    mkdir -p $lib
  '';
})
