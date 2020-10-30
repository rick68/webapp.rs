{ nixpkgs ? <nixpkgs>
, pkgs ? (import nixpkgs {})
, runCommandLocal ? pkgs.runCommandLocal
, callPackage ? pkgs.callPackage
, moz_overlay ? (import (builtins.fetchTarball
  "https://github.com/mozilla/nixpkgs-mozilla/archive/master.tar.gz"))
, moz_nixpkgs ? (import nixpkgs { overlays = [ moz_overlay ]; })
, date ? null
, channel ? "stable"
, rustChannel ? moz_nixpkgs.rustChannelOf { inherit date channel; }
, rustPlatform ? pkgs.makeRustPlatform {
    rustc = rustChannel.rust;
    cargo = rustChannel.cargo;
  }
, backendName ? builtins.readFile (runCommandLocal "backend-name"
  { CARGO_TOML = builtins.readFile ../backend/Cargo.toml; } ''
    echo "$CARGO_TOML" | sed -n -e 's/^name = "\(.*\)"$/\1/p' | head -1 | tr -d '\n' > $out
  '')
, backendVersion ? builtins.readFile (runCommandLocal "backend-version"
  { CARGO_TOML = builtins.readFile ../backend/Cargo.toml; } ''
    echo "$CARGO_TOML" | sed -n -e 's/^version = "\(.*\)"$/\1/p' | head -1 | tr -d '\n' > $out
  '')
, webappSrc ? callPackage ./source.nix {}
, cargoSha256 ? "10c9rnh4r08ciwrf2j1y1cm4q7ybh5mcvikr2c3mrg4n1hx3nixh"
}:

rustPlatform.buildRustPackage rec {
  pname = backendName;
  version = backendVersion;
  src = webappSrc;
  inherit cargoSha256;
  nativeBuildInputs = with pkgs; [ pkg-config ];
  buildInputs = with pkgs; [ openssl postgresql ];
  cargoBuildFlags = [ "--package" "${pname}" ];
  doCheck = false;
  postInstall = ''
    cp -LRv tls $out
    cp -v ${webappSrc}/Config.toml $out
  '';
}
