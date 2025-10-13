{
  lib,
  config,
  ...
}:
let
  inherit (lib) mkIf;
  inherit (lib) mkDefault;
  inherit (lib) mkOption;
  inherit (lib) types;
  inherit (types) bool;

  category = "shells";
  type = "cli";
in
{
  options.${type}.${category}.enable = mkOption {
    description = "Whether to enable default config for the ${category} category.";
    default = config.${type}.enable;
    type = bool;
  };

  config.home.shellAliases = mkIf config.${type}.${category}.enable {
    clear = mkDefault "printf \"\\e[2J\\e[3J\\e[H\"";
  };

  imports = [
    ./bash
    ./fish
    ./nushell
    ./zsh
  ];
}
