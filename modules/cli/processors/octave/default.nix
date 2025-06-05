{
  lib,
  pkgs,
  config,
  ...
}:
let
  inherit (lib) mkOption;
  inherit (lib) mkIf;
  inherit (lib) mkDefault;
  inherit (lib) types;

  inherit (types) bool;

  program = "octave";
  category = "processors";
  type = "cli";
in
{
  options.${type}.${category}.${program}.enable = mkOption {
    description = "Whether to enable ${program}'s default config.";
    default = config.${type}.${category}.enable;
    type = bool;
  };

  config = mkIf config.${type}.${category}.${program}.enable {

    home.shellAliases.${program} = mkDefault "${pkgs.${program}}/bin/${program} --silent";

    home.file.".octaverc".text = mkDefault ''
      # Run by octave every time the program starts

      #| Load all packages installed
      pkg load linear-algebra
      pkg load symbolic

      #| go to the documents folder
      cd("~/Documents");
    '';

    home.packages = with pkgs; [
      (octave.withPackages (
        octavePackages: with octavePackages; [
          # ( Adding some extensions to octave )
          symbolic # Adds the ability for symbolic variables and calculations to Octave
          linear-algebra # Adds more linear algebra functions to Octave
        ]
      ))
    ];
  };
}
