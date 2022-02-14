# shell.nix
let
  kframework = import /home/traian/Documents/k {};
  inherit (kframework) mkShell;
in
mkShell {
  buildInputs = [
    kframework.k
    kframework.llvm-backend
    kframework.haskell-backend
  ];
}
