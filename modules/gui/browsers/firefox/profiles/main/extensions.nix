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
  config.programs.${program}.profiles.${profile}.extensions =
    mkIf config.${type}.${category}.${program}.enable
      {
        force = mkDefault false;
        settings = {
          # <name>.force	Forcibly override any existing configuration for this extension. 	boolean
          # <name>.settings	Json formatted options for the specified extensionID	attribute set of (JSON value)
        };
      };
}
