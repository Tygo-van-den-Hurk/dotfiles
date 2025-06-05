{
  lib,
  ...
}:
let
  inherit (lib) mkOption;
  inherit (lib) types;

  inherit (types) bool;

  type = "gui";
in
{
  options.${type}.enable = mkOption {
    description = "Whether to enable GUI applications and tools.";
    default = false;
    type = bool;
  };

  imports = [
    ./file-viewers
    ./terminals
    ./window-managers
    ./monitors.nix
  ];
}
