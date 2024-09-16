## The entry point when importing my dot files from the System NixOS flake. The point is to act as the home.nix flake.

arguments @ { config, pkgs, lib, machine-settings, ... } : ( builtins.trace "(HM) Loading: ${toString ./.}..." { 
    
  imports = [ ./nix ];

  programs.home-manager.enable = true;

  home = {
    stateVersion = "24.05";
  };    
})
