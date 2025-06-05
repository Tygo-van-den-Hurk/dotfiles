{
  lib,
  config,
  pkgs,
  ...
}:
let
  inherit (lib) mkOption;
  inherit (lib) mkIf;
  inherit (lib) types;

  inherit (types) bool;

  program = "glow";
  category = "editors";
  type = "cli";
in
{
  options.${type}.${category}.${program}.enable = mkOption {
    description = "Whether to enable ${program}'s default config.";
    default = config.${type}.${category}.enable;
    type = bool;
  };

  config.home = mkIf config.${type}.${category}.${program}.enable {
    packages = [ pkgs.glow ];
  };

  config.xdg.configFile = mkIf config.${type}.${category}.${program}.enable {
    "glow/glow.yml".text = builtins.toJSON {
      style = "auto";
      mouse = true;
      pager = false;
      width = 80;
      all = false;
    };
  };
}
