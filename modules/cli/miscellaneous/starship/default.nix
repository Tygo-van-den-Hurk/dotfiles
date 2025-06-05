{
  lib,
  config,
  ...
}:
let
  inherit (lib) mkOption;
  inherit (lib) mkIf;
  inherit (lib) types;
  inherit (types) bool;

  program = "starship";
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
    enable = true;
    enableBashIntegration = true;
    enableFishIntegration = true;
    enableInteractive = true;
    enableIonIntegration = true;
    enableNushellIntegration = true;
    enableZshIntegration = true;
    enableTransience = true;
    settings = {
      format = "$time $username@$hostname:$directory$git_branch$character ";
      right_format = "$all";
      follow_symlinks = true;
      add_newline = false;
      c = import ./c.nix;
      character = import ./character.nix;
      cpp = import ./cpp.nix;
      directory = import ./directory.nix;
      git_branch = import ./git_branch.nix;
      git_commit = import ./git_commit.nix;
      git_metrics = import ./git_metrics.nix;
      git_state = import ./git_state.nix;
      git_status = import ./git_status.nix;
      hostname = import ./hostname.nix;
      nix_shell = import ./nix_shell.nix;
      nodejs = import ./nodejs.nix;
      os = import ./os.nix;
      python = import ./python.nix;
      rust = import ./rust.nix;
      time = import ./time.nix;
      typst = import ./typst.nix;
      username = import ./username.nix;
    };
  };
}
