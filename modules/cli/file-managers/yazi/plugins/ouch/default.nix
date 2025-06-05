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

  plugin = "ouch";
  program = "yazi";
  category = "file-managers";
  type = "cli";
in
{
  options.${type}.${category}.${program}.plugins.${plugin}.enable = mkOption {
    description = "Whether to enable ${program}'s ${plugin} plugin.";
    default = config.${type}.${category}.${program}.enable;
    type = bool;
  };

  config.home = mkIf config.${type}.${category}.${program}.plugins.${plugin}.enable {
    packages = [ pkgs.${plugin} ];
  };

  config.programs.${program} = mkIf config.${type}.${category}.${program}.plugins.${plugin}.enable {
    plugins.${plugin} = mkDefault pkgs.yaziPlugins.${plugin};
    initLua = mkDefault (builtins.readFile ./init.lua);
    settings.opener.extract = [
      {
        run = "ouch d -y %*";
        desc = "Extract here with ouch";
        for = "windows";
      }
      {
        run = "ouch d -y \"\$@\"";
        desc = "Extract here with ouch";
        for = "unix";
      }
    ];

    keymap.mgr.prepend_keymap = [
      {
        on = [ "C" ];
        run = "plugin ouch";
        desc = "Compress with ouch";
      }
    ];
  };
}
