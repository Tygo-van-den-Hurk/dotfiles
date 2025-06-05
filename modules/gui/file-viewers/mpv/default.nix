let
  mimeApps = {
    "audio/mpeg" = [ "mpv.desktop" ];
    "audio/x-wav" = [ "mpv.desktop" ];
    "audio/x-flac" = [ "mpv.desktop" ];
    "audio/ogg" = [ "mpv.desktop" ];
    "video/mp4" = [ "mpv.desktop" ];
    "video/x-matroska" = [ "mpv.desktop" ];
    "video/webm" = [ "mpv.desktop" ];
    "video/x-msvideo" = [ "mpv.desktop" ];
  };
in
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

  program = "mpv";
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

  config.programs.${program} = mkIf config.${type}.${category}.${program}.enable {
    enable = mkDefault true;
    config = mkDefault { };
  };

  config.xdg.mimeApps.defaultApplications =
    mkIf config.${type}.${category}.${program}.mkDefault
      mimeApps;
  config.xdg.mimeApps.associations.added =
    mkIf config.${type}.${category}.${program}.mkDefault
      mimeApps;
}
