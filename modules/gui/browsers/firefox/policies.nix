{
  lib,
  config,
  ...
}:
let
  inherit (lib) mkIf;

  program = "firefox";
  category = "browsers";
  type = "gui";
in
{
  # [See list of policies](https://mozilla.github.io/policy-templates/).	attribute set of (JSON value)
  config.programs.${program}.policies = mkIf config.${type}.${category}.${program}.enable {
    BlockAboutConfig = mkDefault true;
    BlockAboutProfiles = mkDefault true;
    BlockAboutSupport = mkDefault true;
  };
}
