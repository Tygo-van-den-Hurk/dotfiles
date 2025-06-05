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

  program = "zathura";
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
    extraConfig = mkDefault "";
    options = mkDefault { };
  };

  config.programs.bash = mkIf config.${type}.${category}.${program}.enable {
    initExtra = ''
      function zathura() {
        command zathura "$@" &
      }
    '';
  };

  config.programs.zsh = mkIf config.${type}.${category}.${program}.enable {
    initExtra = ''
      zathura() {
        command zathura "$@" &
      }
    '';
  };

  config.programs.fish = mkIf config.${type}.${category}.${program}.enable {
    interactiveShellInit = ''
      function zathura
        command zathura $argv &
      end
    '';
  };

  config.xdg.mimeApps.defaultApplications = mkIf config.${type}.${category}.${program}.mkDefault {
    "application/pdf" = [ "zathura.desktop" ];
  };
}
