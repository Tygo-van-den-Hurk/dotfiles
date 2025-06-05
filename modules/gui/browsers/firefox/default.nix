let
  mimeApps = {
    "x-scheme-handler/http" = [ "firefox.desktop" ];
    "x-scheme-handler/https" = [ "firefox.desktop" ];
    "x-scheme-handler/chrome" = [ "firefox.desktop" ];
    "application/x-extension-htm" = [ "firefox.desktop" ];
    "application/x-extension-html" = [ "firefox.desktop" ];
    "application/x-extension-shtml" = [ "firefox.desktop" ];
    "application/x-extension-xhtml" = [ "firefox.desktop" ];
    "application/x-extension-xht" = [ "firefox.desktop" ];
    "application/xhtml+xml" = [ "firefox.desktop" ];
    "text/html" = [ "firefox.desktop" ];
  };
in
{
  lib,
  config,
  ...
}:
let
  inherit (lib)
    mkOption
    mkDefault
    mkIf
    types
    ;
  inherit (types) bool;

  program = "firefox";
  category = "browsers";
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
    enableGnomeExtensions = mkDefault true;
    bookmarks.configFile = mkDefault null;
  };

  config.xdg.mimeApps.defaultApplications =
    mkIf config.${type}.${category}.${program}.mkDefault
      mimeApps;
  config.xdg.mimeApps.associations.added =
    mkIf config.${type}.${category}.${program}.mkDefault
      mimeApps;

  config.home.sessionVariables = mkIf config.${type}.${category}.${program}.mkDefault {
    BROWSER = mkDefault "${pkgs.${program}}/bin/${program}";
  };

  imports = [
    ./policies.nix
    ./profiles
  ];
}
