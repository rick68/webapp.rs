{ nixpkgs ? <nixpkgs>
, pkgs ? (import nixpkgs {})
, stdenv ? pkgs.stdenv
, runCommandLocal ? pkgs.runCommandLocal
, callPackage ? pkgs.callPackage
, moz_overlay ? (import (builtins.fetchTarball
  "https://github.com/mozilla/nixpkgs-mozilla/archive/master.tar.gz"))
, moz_nixpkgs ? (import nixpkgs { overlays = [ moz_overlay ]; })
, date ? null
, channel ? "stable"
, rustChannel ? moz_nixpkgs.rustChannelOf { inherit date channel; }
, frontendName ? builtins.readFile (runCommandLocal "frontend-name"
  { CARGO_TOML = builtins.readFile ../frontend/Cargo.toml; } ''
    echo "$CARGO_TOML" | sed -n -e 's/^name = "\(.*\)"$/\1/p' | head -1 | tr -d '\n' > $out
  '')
, frontendVersion ? builtins.readFile (runCommandLocal "frontend-version"
  { CARGO_TOML = builtins.readFile ../frontend/Cargo.toml; } ''
    echo "$CARGO_TOML" | sed -n -e 's/^version = "\(.*\)"$/\1/p' | head -1 | tr -d '\n' > $out
  '')
, webappSrc ? callPackage ./source.nix {}
, cargoSha256 ? "1f99nka98j5sdyv9c7sx0yi5lgfjqzl74dwaak435a3inbkwgrjr"
, uikit ? callPackage ./uikit {}
, onlyUseUIkit ? false
}:

let
  cargoDeps = pkgs.rustPlatform.fetchCargoTarball {
    src = webappSrc;
    sourceRoot = null;
    sha256 = cargoSha256;
  };

  fake-git-for-clone-uikit = pkgs.writeShellScriptBin "git" ''
    OUT_DIR=$5
    mkdir -p $OUT_DIR
    cp -a ${uikit}/. $OUT_DIR
    chmod -R +w $OUT_DIR
  '';

in
stdenv.mkDerivation ({
  pname = frontendName;
  version = frontendVersion;
  src = webappSrc;

  nativeBuildInputs = [
    (rustChannel.rust.override {
      targets = [ "wasm32-unknown-unknown" ];
    })
    rustChannel.cargo
  ] ++ (with pkgs; [ wasm-pack pkg-config binaryen]);
  buildInputs = [ fake-git-for-clone-uikit ] ++ (with pkgs; [ openssl ]);

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

    cd $NIX_BUILD_TOP/frontend
    wasm-pack build --no-typescript --release --target web --out-dir $out/pkg
    rm -rf build.rs Cargo.toml src
    mkdir -p $out/static
    cp -R . $out/static
  '';

} // (stdenv.lib.optionalAttrs onlyUseUIkit {
  FRONTEND_PREPARE_STYLE = true;
}))
