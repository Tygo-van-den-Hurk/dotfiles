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

  program = "gh-dash";
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
    settings = rec {
      issuesLimit = mkDefault 20;
      prsLimit = mkDefault issuesLimit;
      refetchIntervalMinutes = mkDefault 30;
      prApproveComment = mkDefault "Looks good to me!";
      view = mkDefault "prs";
      preview = {
        open = mkDefault true;
        width = mkDefault 50;
      };
    };
  };
}
