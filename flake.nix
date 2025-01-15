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
            echo 'eval "$(zellij setup --generate-auto-start zsh)"' >> ~/.zshrc
            zellij action new-tab --layout ./config/layout.kdl
          '';
        };
      }
    );
}
