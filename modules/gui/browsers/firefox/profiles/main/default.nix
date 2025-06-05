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
  config.programs.${program}.profiles.${profile} = mkIf config.${type}.${category}.${program}.enable {
    name = "${profile}";
    isDefault = mkDefault true;
    id = 0;
    preConfig = mkDefault "";
    extraConfig = mkDefault "";
    userChrome = mkDefault (builtins.readFile ./user-chrome.css);
    userContent = mkDefault (builtins.readFile ./user-content.css);
  };

  imports = [
    ./bookmarks.nix
    ./containers.nix
    ./extensions.nix
    ./search.nix
    ./settings.nix
  ];
}
