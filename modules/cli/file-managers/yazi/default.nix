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

  program = "yazi";
  category = "file-managers";
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
    shellWrapperName = mkDefault program;
  };

  imports = [
    ./flavors.nix
    ./keymap.nix
    ./settings.nix
    ./theme.nix
    # plugins:
    ./plugins/git
    ./plugins/lazygit
    ./plugins/ouch
    ./plugins/restore
    ./plugins/starship
    ./plugins/sudo
  ];
}
