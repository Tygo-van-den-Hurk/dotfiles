{
  lib,
  ...
}:
let
  inherit (lib) mkOption;
  inherit (lib) types;

  inherit (types) bool;

  type = "cli";
in
{
  options.${type}.enable = mkOption {
    description = "Whether to enable CLI applications and terminal based tools.";
    default = true;
    type = bool;
  };

  imports = [
    ./editors
    ./file-managers
    ./miscellaneous
    ./processors
    ./shells
    ./version-control
  ];
}
