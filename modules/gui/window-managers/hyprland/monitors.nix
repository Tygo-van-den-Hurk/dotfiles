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

  monitors = lib.mapAttrsToList (
    adapter: monitor:
    let
      horizontal-resolution = toString monitor.resolution.horizontal;
      vertical-resolution = toString monitor.resolution.vertical;
      refresh-rate = toString monitor.refresh-rate;
      scale = toString monitor.scale;
    in
    if monitor ? enable && !monitor.enable then
      "${adapter}, disabled"
    else if monitor ? placement && monitor.placement ? where && monitor.placement.where == "mirror" then
      with monitor.placement;
      "${adapter}, ${horizontal-resolution}x${vertical-resolution}@${refresh-rate}, auto, ${scale}, mirror, ${what}"
    else
      let
        position =
          if
            monitor ? placement
            && monitor.placement ? where
            && monitor.placement.where != null
            && monitor.placement ? what
            && monitor.placement.what != null
          then
            # TODO: implement precise positioning
            # if monitor.placement.where == "above" then
            #   "${config..monitors.${monitor.placement.what}}"
            # else if monitor.placement.where == "right" then
            #   ""
            # else if monitor.placement.where == "below" then
            #   ""
            # else if monitor.placement.where == "left" then
            #   ""
            # else
            "${monitor.placement.where}"
          else
            "auto";
      in
      "${adapter}, ${horizontal-resolution}x${vertical-resolution}@${refresh-rate}, ${position}, ${scale}"
  ) config.${type}.monitors;

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
        # automatically adds any display plugged in thats not defined.
        monitor = monitors ++ [ ", preferred, auto, 1" ];
      };
}
