{pkgs ? import <nixpkgs> {}}: {
  default = pkgs.mkShell {
    nativeBuildInputs = with pkgs; [
      nil
      alejandra
    ];
  };
}
