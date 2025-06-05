{
  lib,
  config,
  ...
}:
let
  inherit (lib) mkOption;
  inherit (lib) mkDefault;
  inherit (lib) mkIf;
  inherit (lib) types;

  inherit (types) bool;

  program = "alacritty";
  category = "terminals";
  type = "gui";
in
{
  options.${type}.${category}.${program}.enable = mkOption {
    description = "Whether to enable ${program}'s default config.";
    default = config.${type}.${category}.enable;
    type = bool;
  };

  config.programs.${program} = mkIf config.${type}.${category}.${program}.enable {
    enable = mkDefault true;
    settings = {
      general.live_config_reload = mkDefault true;
      window = {
        dynamic_title = mkDefault true;
        padding.x = mkDefault 0;
        padding.y = mkDefault 0;
        blur = mkDefault true;
      };
    };
  };
}
