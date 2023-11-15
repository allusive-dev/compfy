{
  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixpkgs-unstable";
    flake-utils.url = "github:numtide/flake-utils";
  };

  outputs = {
    self,
    lib,
    xwininfo,
    nixpkgs,
    withDebug ? false,
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

        dontStrip = withDebug;

        packages = rec {
          default = compfy;
          compfy = pkgs.picom.overrideAttrs (_old: {
            src = ./.;
            buildInputs = buildInputs ++ _old.buildInputs;
            nativeBuildInputs = nativeBuildInputs ++ _old.nativeBuildInputs;
            postInstall = ''
              wrapProgram $out/bin/compfy-trans \
                --prefix PATH : ${lib.makeBinPath [ xwininfo ]}
            '' + lib.optionalString withDebug ''
              cp -r ../src $out/
            '';
          });
        };

        overlays = rec {
          default = compfy;
          compfy = self.packages.default;
        };
      }
    );
}
