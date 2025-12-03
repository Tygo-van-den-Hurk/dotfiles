let
  mimeApps = {
    "image/jpeg" = [ "sxiv.desktop" ];
    "image/png" = [ "sxiv.desktop" ];
    "image/gif" = [ "sxiv.desktop" ];
    "image/webp" = [ "sxiv.desktop" ];
    "image/bmp" = [ "sxiv.desktop" ];
    "image/svg+xml" = [ "sxiv.desktop" ];
  };
in
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

  program = "sxiv";
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
    packages = [ pkgs.sxiv ];
  };

  config.xdg.mimeApps.defaultApplications =
    mkIf config.${type}.${category}.${program}.mkDefault
      mimeApps;
  config.xdg.mimeApps.associations.added =
    mkIf config.${type}.${category}.${program}.mkDefault
      mimeApps;
}
