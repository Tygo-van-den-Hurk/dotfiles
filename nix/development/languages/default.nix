

arguments @ { config, pkgs, lib, machine-settings, ... } : ( builtins.trace "(HM) Loading: ${toString ./.}..." { 
  imports = [
    ./java
    ./java-script
    ./rust
  ];
})
