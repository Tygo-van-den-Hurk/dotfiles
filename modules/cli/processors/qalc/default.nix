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

  program = "qalc";
  category = "processors";
  type = "cli";
in
{
  options.${type}.${category}.${program}.enable = mkOption {
    description = "Whether to enable ${program}'s default config.";
    default = config.${type}.${category}.enable;
    type = bool;
  };

  config.home = mkIf config.${type}.${category}.${program}.enable {

    shellAliases."clac" = mkDefault "set -f; ${program}_function";
    shellAliases."calc" = mkDefault "set -f; ${program}_function";
    shellAliases."calculate" = mkDefault "set -f; ${program}_function";
    shellAliases."calc:" = mkDefault "set -f; ${program}_function";
    shellAliases."calculate:" = mkDefault "set -f; ${program}_function";
    shellAliases.${program} = mkDefault "set -f; ${program}_function";

    packages = with pkgs; [ libqalculate ];
  };

  config.programs.bash = mkIf config.${type}.${category}.${program}.enable {
    initExtra = ''
      ${program}_function() {
        ${pkgs.libqalculate}/bin/${program} "$@"
        local status="$?"
        set +f # enable globing
        return "$status"
      }
    '';
  };

  config.programs.zsh = mkIf config.${type}.${category}.${program}.enable {
    initExtra = ''
      ${program}_function() {
        ${pkgs.libqalculate}/bin/${program} "$@"
        local status="$?"
        set +f # enable globing
        return "$status"
      }
    '';
  };

  config.programs.fish = mkIf config.${type}.${category}.${program}.enable {
    interactiveShellInit = ''
      function ${program}_function
        ${pkgs.libqalculate}/bin/${program} "$@"
        set exit_code $status
        set +f # enable globing
        return "$exit_code"
      end
    '';
  };

}
