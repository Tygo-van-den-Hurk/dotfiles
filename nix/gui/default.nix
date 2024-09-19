## The file to import if you want to import all my dotfiles related to GUIs.

arguments @ { config, pkgs, lib, machine-settings, ... } : ( builtins.trace "(Tygo's HM) Loading: ${toString ./.}..." { 
  imports = [
    ./hyprland
    ./i3wm
  ];
})
