{ nixpkgs ? <nixpkgs>
, pkgs ? (import nixpkgs {})
, stdenv ? pkgs.stdenv
}:

let
  nodePackages = import ./nodepkgs.nix {
    inherit pkgs;
    inherit (stdenv) system;
  };

  version = builtins.readFile (
    pkgs.runCommandLocal "version"
      { PACKAGE_JSON = builtins.readFile ./pkgs.json; } ''
        echo "$PACKAGE_JSON" | ${pkgs.jq}/bin/jq '.[] | .["rollup"]' | tr -d '"\n' > $out
      ''
  );

in
nodePackages."rollup-${version}"
