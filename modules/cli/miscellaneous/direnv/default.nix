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

  program = "direnv";
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
    # enableFishIntegration = mkDefault true;
    enableNushellIntegration = mkDefault true;
    enableZshIntegration = mkDefault true;
    nix-direnv.enable = mkDefault true;
    mise.enable = mkDefault true;
    silent = mkDefault true;
    config = {

      global = {
        bash_path = mkDefault "${pkgs.bash}/bin/bash";
        disable_stdin = mkDefault true;
        load_dotenv = mkDefault false;
        strict_env = mkDefault true;
        warn_timeout = mkDefault config.home.sessionVariables.DIRENV_WARN_TIMEOUT;
        hide_env_diff = mkDefault true;
      };

      whitelist = {
        prefix = [
          "~/Projects/Tygo-van-den-Hurk"
          "~/Projects/school-Tygo-van-den-Hurk"
          "~/Projects/homelab-Tygo-van-den-Hurk"
          "~/Projects/legacy-Tygo-van-den-Hurk"
          "~/Projects/SAFS"
        ];
      };
    };
  };

  config.home.sessionVariables = mkIf config.${type}.${category}.${program}.enable {
    DIRENV_WARN_TIMEOUT = mkDefault "-1.5h"; # disabled
  };
}
