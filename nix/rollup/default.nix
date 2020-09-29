{ pkgs ? import <nixpkgs> {}
, stdenv ? pkgs.stdenv
, runCommandLocal ? pkgs.runCommandLocal
}:

let
  nodeEnv = "production";
  nodePackages = import ./nodepkgs.nix {
    inherit pkgs;
    inherit (stdenv) system;
  };

  name = builtins.readFile (runCommandLocal "name"
    { PKGS_JSON = builtins.readFile ./pkgs.json; } ''
      echo "$PKGS_JSON" | ${pkgs.jq}/bin/jq '.[] | keys | .[0]' | tr -d '"\n' > $out
    '');

  version = builtins.readFile (runCommandLocal "version"
    { PKGS_JSON = builtins.readFile ./pkgs.json; } ''
      echo "$PKGS_JSON" | ${pkgs.jq}/bin/jq '.[] | .[]' | tr -d '"\n' > $out
    '');

in nodePackages."${name}-${version}"
