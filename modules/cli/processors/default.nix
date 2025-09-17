{
  lib,
  config,
  ...
}:
let
  inherit (lib) mkOption;
  inherit (lib) types;
  inherit (types) bool;

  category = "processors";
  type = "cli";
in
{
  options.${type}.${category}.enable = mkOption {
    description = "Whether to enable default config for the ${category} category.";
    default = config.${type}.enable;
    type = bool;
  };

  imports = [
    ./jq
    ./jqp
    ./octave
    ./qalc
  ];
}
