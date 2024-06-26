# Nix-cursors

[ful1e5](https://github.com/ful1e5)'s linux cursors, built from source and packaged for NixOS with home-manager. This is meant to be used with [nix-colors](https://github.com/Misterio77/nix-colors) or a similar package, but it can be used alone.

# Examples:

| ![Gruvbox cursor](./assets/gruvbox.png) | ![Catppuccin cursor](./assets/catppuccin.png) | ![OneDark cursor](./assets/onedark.png) | ![Kanagawa cursor](./assets/kanagawa.png) |
| --- | --- | --- | --- |
| Gruvbox | Catppuccin | OneDark | Kanagawa |

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
    package = inputs.nix-cursors.packages.${pkgs.system}.bibata-original-cursor.override {
        background_color = "#${config.colorScheme.palette.base00}";
        outline_color = "#${config.colorScheme.palette.base06}";
        accent_color = "#${config.colorScheme.palette.base00}";
    };
    name = "Bibata-Original-Custom";
    size = 24;
    gtk.enable = true;
};
```
The `bibata-original` and `bibata-modern` cursors also have an option called `replace_crosshair`. It will replace the crosshair cursor with the normal pointer cursor, so that it does not show up in screenshots taken from the top left.
