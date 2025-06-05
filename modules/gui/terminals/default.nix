{
  lib,
  config,
  pkgs,
  ...
}:
let
  inherit (lib) mkOption;
  inherit (lib) mkDefault;
  inherit (lib) mkIf;
  inherit (lib) types;

  inherit (types) bool;
  inherit (types) str;

  category = "terminals";
  type = "gui";
in
{
  options.${type}.${category} = {
    enable = mkOption {
      description = "Whether to enable default config for the ${category} category.";
      default = config.${type}.enable;
      type = bool;
    };

    default = mkOption {
      description = "The default application out of all the ${category}.";
      default = "kitty";
      type = str;
    };
  };

  config.home.sessionVariables = mkIf config.${type}.${category}.enable {
    TERMINAL = mkDefault "${pkgs.${config.${type}.${category}.default}}/bin/${
      config.${type}.${category}.default
    }";
  };

  imports = [
    ./alacritty
    ./kitty
  ];
}
