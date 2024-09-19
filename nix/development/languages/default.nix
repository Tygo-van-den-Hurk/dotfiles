

arguments @ { config, pkgs, lib, machine-settings, ... } : ( builtins.trace "(Tygo's HM) Loading: ${toString ./.}..." { 
  imports = [
    ./java
    ./java-script
    ./rust
  ];
})
