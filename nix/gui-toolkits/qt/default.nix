## The configuration for QT

arguments @ { config, pkgs, lib, machine-settings, ... } : ( builtins.trace "(Tygo's HM) Loading: ${toString ./.}..." { 
  
  qt= {
    enable = true;
    platformTheme.name = "gtk";
  };
})
