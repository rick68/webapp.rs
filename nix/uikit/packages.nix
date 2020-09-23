{ nixpkgs ? <nixpkgs>
, pkgs ? import nixpkgs {}
, callPackage ? pkgs.callPackage
}:

let
  common = opts: callPackage (import ./common.nix opts);

in
  rec {

    uikit = uikit_3_5_4;

    uikit_3_1_6 = common {
      buildVersion = "3.1.6";
      sha256 = "0w5q8jcnin95ihij0cz32r3xqdlimzrvh71q450vgwal01079z0s";
    } {};

    uikit_3_5_4 = common {
      buildVersion = "3.5.4";
      sha256 = "1bcnmqgknxj0fdsqv0vbhdp39gyxssgb7z17kdlw7n16rwmfcl34";
    } {};

  }