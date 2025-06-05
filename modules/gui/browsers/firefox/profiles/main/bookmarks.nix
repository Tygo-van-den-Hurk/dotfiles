{
  lib,
  config,
  ...
}:
let
  inherit (lib) mkDefault mkIf;

  profile = "main";
  program = "firefox";
  category = "browsers";
  type = "gui";
in
{
  config.programs.${program}.profiles.${profile}.bookmarks =
    mkIf config.${type}.${category}.${program}.enable
      {
        force = mkDefault true;
        settings = [

        ];
      };
}
