## The file to import if you want to import all my dotfiles related to Development tools.

arguments @ { config, pkgs, lib, machine-settings, ... } : ( builtins.trace "Loading: ${toString ./.}..." { 
  imports = [
    ./languages
    ./tools
  ];
})
