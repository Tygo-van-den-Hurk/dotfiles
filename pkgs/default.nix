# Custom packages, that can be defined similarly to ones from nixpkgs
# You can build them using 'nix build .#example'
pkgs: {
  preview = import ./preview pkgs;
  hibernate = import ./hibernate pkgs;
  nbcat = import ./nbcat pkgs;
  backuper = import ./backuper pkgs;
}
