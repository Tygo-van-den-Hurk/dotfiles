{
  lib,
  config,
  ...
}:
let
  inherit (lib) mkIf;

  program = "yazi";
  category = "file-managers";
  type = "cli";
in
{
  config.programs.${program}.keymap = mkIf config.${type}.${category}.${program}.enable {

  };
}
