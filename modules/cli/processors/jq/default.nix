{
  lib,
  config,
  ...
}:
let
  inherit (lib) mkOption;
  inherit (lib) mkIf;
  inherit (lib) mkDefault;
  inherit (lib) types;

  inherit (types) bool;

  colors = import ./jq-terminal-colors.nix;

  program = "jq";
  category = "processors";
  type = "cli";
in
{
  options.${type}.${category}.${program}.enable = mkOption {
    description = "Whether to enable ${program}'s default config.";
    default = config.${type}.${category}.enable;
    type = bool;
  };

  config.programs.${program} = mkIf config.${type}.${category}.${program}.enable {
    enable = mkDefault true;
    colors = {
      arrays = colors.white.bright;
      objects = colors.white.bright;
      objectKeys = colors.cyan.normal;
      false = colors.blue.normal;
      null = colors.blue.bright;
      numbers = colors.green.normal;
      strings = colors.yellow.normal;
      true = colors.blue.normal;
    };
  };
}
