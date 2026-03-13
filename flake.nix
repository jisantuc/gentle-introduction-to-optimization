{
  description = "A Gentle Introduction to Optimization exercises";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs?ref=nixos-25.11";
  };

  outputs = { self, nixpkgs }:
    let
      system = "aarch64-darwin";
      pkgs = nixpkgs.legacyPackages.${system};
    in
    {

      devShells.${system}.default = pkgs.mkShell
        {
          packages = with pkgs; [
            tinymist
            typst
          ];
          TYPST_ROOT = ".";
        };

    };
}
