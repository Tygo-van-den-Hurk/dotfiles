{
  lib,
  config,
  ...
}:
let
  inherit (lib) mkIf;

  program = "hyprland";
  category = "window-managers";
  type = "gui";
in
{
  # options.${type}.${category}.${program} = mkOption {
  #   description = "Set of monitors this system has.";
  #   default = builtins.mapAttrs (adapter: monitor:
  #     if
  #       monitor.primary
  #       &&
  #       then {
  #       horizontal = 0;
  #       vertical = 0;
  #     }
  #     else if monitor.primary then {
  #       horizontal = 0;
  #       vertical = 0;
  #     }
  #     else abort "UNDEFINED"
  #   ) config.gui.monitors;
  #   example = literalExample {
  #     "HDMI-1-1" = {
  #       # On the left side of the middle monitor as an HD monitor
  #       vertical = 0;
  #       horizontal = -1920;
  #     };
  #     "eDP-1" = {
  #       vertical = 0;
  #       horizontal = 0;
  #     };
  #     "HDMI-1-2" = {
  #       # On the right side of an HD monitor
  #       vertical = 0;
  #       horizontal = 1920;
  #     };

  #   };
  #   type = attrsOf (
  #     submodule (
  #       _:
  #       {
  #         horizontal = mkOption {
  #           description = "Horizontal position of the display in pixels.";
  #           example = 1920;
  #           type = int;
  #         };

  #         vertical = mkOption {
  #           description = "Vertical position of the display in pixels.";
  #           example = 1080;
  #           type = int;
  #         };
  #       }
  #     )
  #   )
  # };

  config.wayland.windowManager.${program}.settings =
    mkIf config.${type}.${category}.${program}.enable
      {
        workspace =
          let

            get-workspace-settings = _: settings: settings;
            workspaces = lib.mapAttrsToList get-workspace-settings config.${type}.${category}.workspaces;

            is-enabled = workspace: workspace.enable;
            enabled-workspaces = builtins.filter is-enabled workspaces;

            by-order = workspace-a: workspace-b: workspace-a.order <= workspace-b.order;
            sorted-workspaces = builtins.sort by-order enabled-workspaces;

            result = map (
              workspace:
              let
                inherit (workspace) name;
                monitor =
                  #   if workspace ? display
                  # then
                  #   "monitor:${workspace.display},"
                  # else
                  "";
              in
              "name:${name}, ${monitor}"
            ) sorted-workspaces;
          in
          result;
      };
}
