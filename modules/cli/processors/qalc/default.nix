{
  lib,
  pkgs,
  config,
  ...
}:
let
  inherit (lib) mkOption;
  inherit (lib) mkIf;
  inherit (lib) mkDefault;
  inherit (lib) types;

  inherit (types) bool;

  program = "qalc";
  category = "processors";
  type = "cli";
in
{
  options.${type}.${category}.${program}.enable = mkOption {
    description = "Whether to enable ${program}'s default config.";
    default = config.${type}.${category}.enable;
    type = bool;
  };

  config = mkIf config.${type}.${category}.${program}.enable {

    home.shellAliases."calc" = mkDefault program;
    home.shellAliases."calculate" = mkDefault program;
    home.shellAliases."calc:" = mkDefault program;
    home.shellAliases."calculate:" = mkDefault program;

    home.packages = with pkgs; [ libqalculate ];
  };
}
