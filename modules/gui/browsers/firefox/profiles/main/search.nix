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
  config.programs.${program}.profiles.${profile}.search =
    mkIf config.${type}.${category}.${program}.enable
      {
        force = mkDefault true;
        privateDefault = mkDefault "ddg";
        default = mkDefault "ddg";
        order = mkDefault [ "ddg" ];
        engines = {

          bing.metaData.hidden = true;

          google.metaData.alias = "@g";

          ddg.metaData.alias = "@ddg";

          nix-packages = {
            name = "Nix Packages";
            icon = "${pkgs.nixos-icons}/share/icons/hicolor/scalable/apps/nix-snowflake.svg";
            definedAliases = [ "@np" ];
            urls = [
              {
                template = "https://search.nixos.org/packages";
                params = [
                  {
                    name = "query";
                    value = "{searchTerms}";
                  }
                ];
              }
            ];
          };
        };
      };
}
