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

  program = "thunar";
  category = "file-viewers";
  type = "gui";
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

  config.home = mkIf config.${type}.${category}.${program}.enable {
    packages = [ pkgs.xfce.thunar ];
  };

  config.xdg.mimeApps.defaultApplications = mkIf config.${type}.${category}.${program}.mkDefault {
    "inode/directory" = [ "thunar.desktop" ];
  };
}
