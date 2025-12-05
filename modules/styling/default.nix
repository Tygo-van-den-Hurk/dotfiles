{
  lib,
  ...
}:
let
  inherit (lib) mkOption;
  inherit (lib) types;
  inherit (types) bool;

  type = "styling";
in
{
  options.${type}.enable = mkOption {
    description = "Whether to enable styling of all tools.";
    default = false;
    type = bool;
  };

  imports = [
    ./fonts
    ./gtk
    ./qt
    ./stylix
  ];
}
