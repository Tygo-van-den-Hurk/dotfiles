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

  plugin = "starship";
  program = "yazi";
  category = "file-managers";
  type = "cli";
in
{
  options.${type}.${category}.${program}.plugins.${plugin}.enable = mkOption {
    description = "Whether to enable ${program}'s ${plugin} plugin.";
    default = config.${type}.${category}.${program}.enable && config.programs.${plugin}.enable;
    type = bool;
  };

  config.programs.${program} = mkIf config.${type}.${category}.${program}.plugins.${plugin}.enable {
    plugins.${plugin} = mkDefault pkgs.yaziPlugins.${plugin};
    initLua = mkDefault (builtins.readFile ./init.lua);
  };
}
