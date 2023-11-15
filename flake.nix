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
        nativeBuildInputs = with pkgs; [ go-md2man ];
        buildInputs = with pkgs; [ pcre2 ];
      in {
        devShells.default = pkgs.mkShell {inherit nativeBuildInputs buildInputs;};

        packages = rec {
          default = compfy;
          compfy = pkgs.picom.overrideAttrs (_old: {
            src = ./.;
            name = "compfy";
            buildInputs = buildInputs ++ _old.buildInputs;
            nativeBuildInputs = nativeBuildInputs ++ _old.nativeBuildInputs;
            postInstall = '''';
            mainProgram = "compfy";
          });
        };

        overlays = rec {
          default = compfy;
          compfy = self.packages.default;
        };
      }
    );
}
