with import <nixpkgs> { };

pkgs.mkShell {
  nativeBuildInputs = with pkgs; [
    fasm
    wasmtime
    gcc
    binutils
  ];
}
