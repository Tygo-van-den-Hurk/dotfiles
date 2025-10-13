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

  program = "zsh";
  category = "shells";
  type = "cli";
in
{
  options.${type}.${category}.${program}.enable = mkOption {
    description = "Whether to enable ${program}'s default config.";
    default = config.${type}.${category}.enable;
    type = bool;
  };

  config.programs.${program} = mkIf config.${type}.${category}.${program}.enable {
    autocd = mkDefault true;
    enableCompletion = mkDefault true;
    autosuggestion = {
      enable = mkDefault true;
      highlight = mkDefault null;
      strategy = mkDefault [
        "completion"
        "history"
        "match_prev_cmd"
      ];
    };
  };
}
