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

  program = "eza";
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
    colors = mkDefault "auto";
    enableBashIntegration = mkDefault true;
    enableFishIntegration = mkDefault true;
    enableIonIntegration = mkDefault true;
    enableNushellIntegration = mkDefault true;
    enableZshIntegration = mkDefault true;
    git = mkDefault true;
    icons = mkDefault "auto";
    theme = { };
    extraOptions = mkDefault [
      "--long"
      "--group-directories-first"
    ];
  };

  config.home.shellAliases =
    let
      bin = "${pkgs.${program}}/bin/${program}";
    in
    mkIf config.${type}.${category}.${program}.enable {
      la = mkDefault "${bin} --group-directories-first --all";
      ll = mkDefault "${bin} --group-directories-first --long ";
      lla = mkDefault "${bin} --group-directories-first --long --all";
      ls = mkDefault "${bin} --group-directories-first --long";
      lt = mkDefault "${bin} --group-directories-first --tree --all";
      tree = mkDefault "${bin} --group-directories-first --tree";
    };
}
