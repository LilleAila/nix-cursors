{pkgs ? import <nixpkgs> {}}: {
  google-cursor = pkgs.callPackage ./google-cursor.nix {};
  fuchsia-cursor = pkgs.callPackage ./fuchsia-cursor.nix {};
  breeze-cursor = pkgs.callPackage ./breeze-cursor.nix {};
  apple-cursor = pkgs.callPackage ./apple-cursor.nix {};
  bibata-original-cursor = pkgs.callPackage ./bibata-original-cursor.nix {};
  bibata-modern-cursor = pkgs.callPackage ./bibata-modern-cursor.nix {};
}
