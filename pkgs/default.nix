# Custom packages, that can be defined similarly to ones from nixpkgs
# You can build them using 'nix build .#example'
pkgs: {
  preview = import ./preview pkgs;
  hibernate = import ./hibernate pkgs;
  backuper = import ./backuper pkgs;
}
