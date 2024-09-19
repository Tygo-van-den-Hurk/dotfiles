## The configuration for GTK

arguments @ { config, pkgs, lib, machine-settings, ... } : ( builtins.trace "(Tygo's HM) Loading: ${toString ./.}..." { 
  
  gtk = {
    enable = true;
    
  };
})
