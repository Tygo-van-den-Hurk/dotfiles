{
  lib,
  config,
  ...
}:
let
  inherit (lib) mkOption;
  inherit (lib) mkIf;
  inherit (lib) mkDefault;
  inherit (lib) types;
  inherit (types) bool;

  program = "zellij";
  category = "miscellaneous";
  type = "cli";
in
{
  options.${type}.${category}.${program}.enable = mkOption {
    description = "Whether to enable ${program}'s default config.";
    default = config.${type}.${category}.enable;
    type = bool;
  };

  config.programs.${program} = mkIf config.${type}.${category}.${program}.enable {
    enable = mkDefault true;
    attachExistingSession = mkDefault true;
    enableBashIntegration = mkDefault true;
    enableFishIntegration = mkDefault true;
    enableZshIntegration = mkDefault true;
    exitShellOnExit = mkDefault true;
    settings = {
      on_force_close = mkDefault "quit";
      show_startup_tips = mkDefault false;
      theme = mkDefault "default";
    };
  };
}
