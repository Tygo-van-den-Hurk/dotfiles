{
  lib,
  pkgs,
  config,
  ...
}:
let
  inherit (lib) mkOption;
  inherit (lib) mkIf;
  inherit (lib) types;
  inherit (types) bool;

  program = "onefetch";
  category = "miscellaneous";
  type = "cli";
in
{
  options.${type}.${category}.${program}.enable = mkOption {
    description = "Whether to enable ${program}'s default config.";
    default = config.${type}.${category}.enable;
    type = bool;
  };

  config = mkIf config.${type}.${category}.${program}.enable {

    home.packages = [ pkgs.onefetch ];

    # Shell completion seems to be added automatically already.
    #// programs.bash.initExtra = ''eval "${pkgs.onefetch}/bin/onefetch --generate bash" '';
    #// # programs.elvish.initExtra = ''eval (${pkgs.onefetch}/bin/onefetch --generate elvish | slurp)'';
    #// programs.zsh.initExtra = ''source <(${pkgs.onefetch}/bin/onefetch --generate zsh)'';
    #// programs.fish.interactiveShellInit = ''
    #//   ${pkgs.onefetch}/bin/onefetch --generate fish > ~/.config/fish/completions/onefetch.fish
    #// '';
  };
}
