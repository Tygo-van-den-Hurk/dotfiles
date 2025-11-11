{
  config,
  lib,
  pkgs,
  ...
}:
let
  inherit (lib) mkOption;
  inherit (lib) types;
  inherit (lib) mkIf;

  inherit (types) bool;

  type = "cli";
in
{
  options.${type}.enable = mkOption {
    description = "Whether to enable CLI applications and terminal based tools.";
    default = true;
    type = bool;
  };

  # Global config that does not depend on anything.
  config.home = mkIf config.${type}.enable {
    shellAliases = {
      c = "clear";
      ear = ":";
    };
    packages = with pkgs; [
      undollar
    ];
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
