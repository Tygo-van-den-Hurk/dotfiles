{
  lib,
  config,
  ...
}:
let
  inherit (lib) mkOption;
  inherit (lib) types;
  inherit (lib) mkDefault;
  inherit (lib) mkIf;

  inherit (types) bool;

  category = "gtk";
  type = "styling";
in
{
  options.${type}.${category}.enable = mkOption {
    description = "Whether to enable styling using the ${category} framework.";
    default = config.${type}.enable;
    type = bool;
  };

  config.${category} = mkIf config.${type}.${category}.enable {
    enable = mkDefault true;
  };
}
