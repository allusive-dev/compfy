{
  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixpkgs-unstable";
    flake-utils.url = "github:numtide/flake-utils";
  };

  outputs = {
    self,
    nixpkgs,
    flake-utils,
    ...
  }:
    flake-utils.lib.eachDefaultSystem (
      system: let
        pkgs = nixpkgs.legacyPackages.${system};
      in {
        devShells.default = pkgs.mkShell {
          nativeBuildInputs = with pkgs; [];
          buildInputs = with pkgs; [];
        };

        packages = rec {
          default = picom-allusive;
          picom-allusive = pkgs.picom.overrideAttrs (_old: {src = ./.;});
        };

        overlays = rec {
          default = picom-allusive;
          picom-allusive = self.packages.default;
        };
      }
    );
}
