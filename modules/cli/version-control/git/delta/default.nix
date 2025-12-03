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

  helper = "delta";
  program = "git";
  category = "version-control";
  type = "cli";
in
{
  options.${type}.${category}.${program}.${helper}.enable = mkOption {
    description = "Whether to enable ${program} ${helper}'s default config.";
    default = config.${type}.${category}.${program}.enable;
    type = bool;
  };

  config.programs.${program} = mkIf config.${type}.${category}.${program}.${helper}.enable {
    settings.merge.conflictstyle = mkDefault "zdiff3";
  };

  config.programs.${helper} = mkIf config.${type}.${category}.${program}.${helper}.enable {
    enable = mkDefault true;
    options = {
      line-numbers = mkDefault true;
      hyperlinks = mkDefault true;
      hyperlinks-file-link-format = mkDefault "vscode://file/{path}:{line}";
      side-by-side = mkDefault true;
      line-numbers-left-format = mkDefault "";
      line-numbers-right-format = mkDefault "│ ";
    };
  };
}
