{
  lib,
  config,
  ...
}:
let
  inherit (lib) mkDefault;
  inherit (lib) mkIf;
  inherit (lib) mkOption;
  inherit (lib) types;

  inherit (types) bool;

  program = "hyprland";
  category = "window-managers";
  type = "gui";
in
{

  options.${type}.${category}.${program}.enable = mkOption {
    description = "Whether to enable ${program}'s default config.";
    default = config.${type}.${category}.enable;
    type = bool;
  };

  config.wayland.windowManager.${program} = mkIf config.${type}.${category}.${program}.enable {
    enable = mkDefault true;
    settings = {

    };
  };

  imports = [
    ./monitors.nix
    ./workspaces.nix
  ];
}
