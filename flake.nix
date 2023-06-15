{
  description = "happy-hacking-gnu nix overlay";

  inputs = {
    happy-hacking-gnu-src = {
      url =
        "git+https://gitlab.com/dom/happy-hacking-gnu.git?submodules=1&?rev=85dfbba4cfc11a34f2dd8e984e9d46112f04a7e1";
      flake = false;
    };
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
  };

  outputs = { self, nixpkgs, happy-hacking-gnu-src }:
    let
      overlay = final: prev: {
        happy-hacking-gnu = prev.callPackage ./happy-hacking-gnu.nix {
          inherit happy-hacking-gnu-src;
          version = "0.2.1";
        };
      };
      pkgs = nixpkgs.legacyPackages.x86_64-linux.extend overlay;
    in {
      overlays.default = overlay;
      legacyPackages.x86_64-linux.happy-hacking-gnu = pkgs.happy-hacking-gnu;
    };
}
