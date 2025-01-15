{
  description = "nodejs flake sample";
  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixpkgs-unstable";
    flake-utils.url = "github:numtide/flake-utils";
  };

  outputs =
    inputs:
    inputs.flake-utils.lib.eachDefaultSystem (
      system:
      let
        pkgs = inputs.nixpkgs.legacyPackages.${system};
      in
      {
        devShells.default = pkgs.mkShell {
          packages = with pkgs; [
            typst
            zellij
            tdf
          ];
          shellHook = ''
            typst compile ./src/report.typ
            zellij setup --generate-auto-start zsh
            zellij --layout ./config/layout_file.kdl
          '';
        };
      }
    );
}
