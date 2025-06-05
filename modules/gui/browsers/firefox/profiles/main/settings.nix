{
  lib,
  config,
  ...
}:
let
  inherit (lib) mkIf;

  profile = "main";
  program = "firefox";
  category = "browsers";
  type = "gui";
in
{
  config.programs.${program}.profiles.${profile}.settings =
    mkIf config.${type}.${category}.${program}.enable
      {
      };
}
