{
  lib,
  ...
}:
let
  inherit (lib) mkOption;
  inherit (lib) types;

  inherit (types) str;
  inherit (types) bool;
  inherit (types) int;
  inherit (types) attrsOf;
  inherit (types) submodule;
  inherit (types) nullOr;

  category = "window-managers";
  type = "gui";
in
{
  options.${type}.${category}.workspaces = mkOption rec {
    description = "The workspaces a window-manager should have";
    default.workspace01.name = "Terminal";
    default.workspace01.order = 1;
    default.workspace02.name = "Code Editor";
    default.workspace02.order = default.workspace01.order + 1;
    default.workspace03.name = "Browser";
    default.workspace03.order = default.workspace02.order + 1;
    default.workspace04.name = "Massagers";
    default.workspace04.order = default.workspace03.order + 1;
    default.workspace05.name = "File Browser";
    default.workspace05.order = default.workspace04.order + 1;
    type = attrsOf (
      submodule (_: {

        options.enable = mkOption {
          description = "Adapter name to place this monitor relative to.";
          default = true;
          example = false;
          type = bool;
        };

        options.name = mkOption {
          description = "The name this workspace will have when displayed some where.";
          example = "Terminal";
          type = str;
        };

        options.order = mkOption {
          description = "The order in which they should appear in respect to each other.";
          example = 1;
          type = int;
        };

        options.display = mkOption {
          description = "The name of the adapter this workspace will be displayed onto.";
          example = "eDP-1";
          default = null;
          type = nullOr str;
        };

      })
    );
  };

  imports = [
    ./hyprland
  ];
}
