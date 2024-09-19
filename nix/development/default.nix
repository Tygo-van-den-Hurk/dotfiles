## The file to import if you want to import all my dotfiles related to Development tools.

arguments @ { config, pkgs, lib, machine-settings, ... } : ( builtins.trace "(Tygo's HM) Loading: ${toString ./.}..." { 
  imports = [
    ./languages
    ./tools
  ];
})
