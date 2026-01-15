{
  lib,
  config,
  pkgs,
  ...
}:
let
  inherit (lib) mkOption;
  inherit (lib) types;
  inherit (lib) mkIf;
  inherit (types) bool;

  category = "fonts";
  type = "styling";
in
{
  options.${type}.${category}.enable = mkOption {
    description = "Whether to enable default config for the ${category} category.";
    default = config.${type}.enable;
    type = bool;
  };

  config.home = mkIf config.${type}.${category}.enable {
    packages = with pkgs; [
      nerd-fonts.open-dyslexic
      noto-fonts-color-emoji
    ];
  };
}
