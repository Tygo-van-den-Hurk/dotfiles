{
  lib,
  ...
}:
let
  inherit (lib) mkOption;
  inherit (lib) types;
  inherit (lib) literalExample;

  inherit (types) bool;
  inherit (types) int;
  inherit (types) str;
  inherit (types) attrsOf;
  inherit (types) submodule;
  inherit (types) nullOr;
  inherit (types) enum;

  type = "gui";
in
{
  options.${type}.monitors = mkOption {
    description = "Set of monitors this system has.";
    default = { };
    example = literalExample {
      "eDP-1" = {
        primary = true;
        adapter = "eDP-1";
        refresh-rate = 60;
        resolution.vertical = 1080;
        resolution.horizontal = 1920;
      };
    };
    type = attrsOf (
      submodule (_: {
        options = {

          enable = mkOption {
            description = "Whether to enable this monitor.";
            default = true;
            example = false;
            type = bool;
          };

          primary = mkOption {
            description = "Whether this is the primary monitor.";
            default = false;
            example = true;
            type = bool;
          };

          refresh-rate = mkOption {
            description = "Refresh rate of the display in Hz.";
            example = 60;
            type = int;
          };

          resolution = {
            horizontal = mkOption {
              description = "Horizontal resolution of the display in pixels.";
              example = 1920;
              type = int;
            };

            vertical = mkOption {
              description = "Vertical resolution of the display in pixels.";
              example = 1080;
              type = int;
            };
          };

          placement = {
            where = mkOption {
              description = "Relative position (e.g. left-of, right-of, above, below).";
              default = null;
              type = nullOr (enum [
                "above"
                "left"
                "right"
                "below"
                "mirror"
              ]);
            };

            what = mkOption {
              description = "Adapter name to place this monitor relative to.";
              default = null;
              type = nullOr str;
            };
          };

          v-sync = mkOption {
            description = "Whether this monitor supports v-sync.";
            default = false;
            example = true;
            type = bool;
          };

          scale = mkOption {
            description = "The scale of the display in the system.";
            example = 2;
            default = 1;
            type = int;
          };
        };
      })
    );
  };
}
