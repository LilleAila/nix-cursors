{
  description = "A simple nix flake using flake-parts";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
  };

  outputs = {nixpkgs, ...} @ inputs: let
    lib = nixpkgs.lib;
    systems = [
      "x86_64-linux"
      "aarch64-linux"
    ];
    forEachSystem = f: lib.genAttrs systems (system: f pkgsFor.${system});
    pkgsFor = lib.genAttrs systems (
      system:
        import nixpkgs {
          inherit system;
        }
    );
  in {
    packages = forEachSystem (pkgs: import ./pkgs {inherit pkgs;});
    devShells = forEachSystem (pkgs: import ./shell.nix {inherit pkgs;});
  };
}
