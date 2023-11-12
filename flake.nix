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
        nativeBuildInputs = with pkgs; [];
        buildInputs = with pkgs; [pcre2];
      in {
        devShells.default = pkgs.mkShell {inherit nativeBuildInputs buildInputs;};

        packages = rec {
          default = picom-allusive;
          picom-allusive = pkgs.picom.overrideAttrs (_old: {
            src = ./.;
            buildInputs = buildInputs ++ _old.buildInputs;
            nativeBuildInputs = nativeBuildInputs ++ _old.nativeBuildInputs;
          });
        };

        overlays = rec {
          default = picom-allusive;
          picom-allusive = self.packages.default;
        };
      }
    );
}
