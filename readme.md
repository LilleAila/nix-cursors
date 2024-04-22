# Nix-cursors

[ful1e5](https://github.com/ful1e5)'s linux cursors, built from source and packaged for NixOS with home-manager. This is meant to be used with [nix-colors](https://github.com/Misterio77/nix-colors) or a similar package, but it can be used alone.

## Usage
Add this repo to your flake inputs
```nix
# flake.nix
inputs = {
    # ...
    nix-cursors = {
      url = "github:LilleAila/nix-cursors";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    # ...
}
```
Here is an example of how you can configure it with home-manager and nix-colors. The colors can be changed, or left as default. To see the available cursors, look in the `pkgs` directory, or run `nix flake show github:LilleAila/nix-cursors`.
```nix
home.pointerCursor = {
    package = outputs.packages.${pkgs.system}.bibata-original-cursor.override {
        background_color = "#${config.colorScheme.palette.base00}";
        outline_color = "#${config.colorScheme.palette.base06}";
        accent_color = "#${config.colorScheme.palette.base0B}";
    };
    name = "Bibata-Original-Custom";
    size = 24;
    gtk.enable = true;
};
```
