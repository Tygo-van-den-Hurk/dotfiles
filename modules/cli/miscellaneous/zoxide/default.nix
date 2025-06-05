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

  category = "miscellaneous";
  program = "zoxide";
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
    enableNushellIntegration = mkDefault true;
    enableZshIntegration = mkDefault true;
    options = [
      "--cmd=cd"
    ];
  };

  config.home.shellAliases = mkIf config.${type}.${category}.${program}.enable {
    ".." = mkDefault "cd ..";
    "..." = mkDefault "cd ../..";
    "cd.." = mkDefault "cd ..";
    "cd" = mkDefault "${pkgs.${program}}/bin/${program}";
  };

  config.home.sessionVariables = mkIf config.${type}.${category}.${program}.enable {
    ZO_FZF_OPTS =
      let
        show_options = "--git  --long --smart-group --mounts --group-directories-first --color=auto";
        hide_options = "--no-filesize --no-permissions --no-user --no-time";
      in
      "--preview '${pkgs.eza}/bin/eza ${show_options} {} ${hide_options}' --cycle";
  };
}
