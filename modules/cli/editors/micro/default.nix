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

  program = "micro";
  category = "editors";
  type = "cli";
in
{
  options.${type}.${category}.${program} = {

    enable = mkOption {
      description = "Whether to enable ${program}'s default config.";
      default = config.${type}.${category}.enable;
      type = bool;
    };

    mkDefault = mkOption {
      description = "Whether to make ${program} the default program to open its file type.";
      default = config.${type}.${category}.${program}.enable;
      type = bool;
    };
  };

  config.programs.${program} = mkIf config.${type}.${category}.${program}.enable {
    enable = mkDefault true;
    package = pkgs.micro-full;
    settings = mkDefault { };
  };

  config.home.sessionVariables = mkIf config.${type}.${category}.${program}.mkDefault {
    EDITOR = mkDefault "${pkgs.${program}}/bin/${program}";
  };
}
