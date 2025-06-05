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

  program = "gh";
  category = "version-control";
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
    gitCredentialHelper.enable = mkDefault true;
    settings = {
      version = mkDefault "1";
      git_protocol = mkDefault "ssh";
      prompt = mkDefault "enabled";
      pager = mkDefault "bat --style=plain --color=always --pager=never";
      aliases = {
        co = mkDefault "pr checkout";
      };
    };
  };
}
