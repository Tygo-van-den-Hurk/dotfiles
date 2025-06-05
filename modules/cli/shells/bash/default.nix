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

  program = "bash";
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
    enableCompletion = mkDefault true;
    enable = mkDefault true;
    historyIgnore = [
      "ls"
      "preview"
      "cd"
      "cat"
      "bat"
    ];
  };
}
