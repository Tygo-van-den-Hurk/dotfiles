{
  lib,
  config,
  ...
}:
let
  inherit (lib) mkOption;
  inherit (lib) mkIf;
  inherit (lib) types;

  inherit (types) bool;

  program = "ranger";
  category = "file-managers";
  type = "cli";
in
{
  options.${type}.${category}.${program}.enable = mkOption {
    description = "Whether to enable ${program}'s default config.";
    default = config.${type}.${category}.enable;
    type = bool;
  };

  config.programs.${program} = mkIf config.${type}.${category}.${program}.enable {
    enable = true;
    settings = {
      column_ratios = "1,3,3";
      confirm_on_delete = "never";
      scroll_offset = 8;
      unicode_ellipsis = true;
    };
  };
}
