{
  lib,
  pkgs,
  config,
  ...
}:
let
  inherit (lib) mkOption;
  inherit (lib) mkIf;
  inherit (lib) mkDefault;
  inherit (lib) types;
  inherit (types) bool;

  program = "fzf";
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
    enableBashIntegration = mkDefault true;
    enableFishIntegration = mkDefault true;
    enableZshIntegration = mkDefault true;
    tmux.enableShellIntegration = mkDefault true;
    tmux.shellIntegrationOptions = mkDefault [ ];
    defaultOptions = [
      "--preview"
      "'${pkgs.preview}/bin/preview {}'"
      "--height 40%"
      "--border"
    ];
  };
}
