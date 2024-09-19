## The configuration for GUI Toolkits

arguments @ { config, pkgs, lib, machine-settings, ... } : ( builtins.trace "(Tygo's HM) Loading: ${toString ./.}..." { 
  imports = [
    ./gtk
    ./qt
  ];
})
