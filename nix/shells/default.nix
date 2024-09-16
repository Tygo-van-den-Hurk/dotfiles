## The file to import if you want to import all my dotfiles related to Shells.

arguments @ { config, pkgs, lib, machine-settings, ... } : ( builtins.trace "(HM) Loading: ${toString ./.}..." { 
  imports = [
    ./bash
    ./fish
    ./zsh
  ];
})
