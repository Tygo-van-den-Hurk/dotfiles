## 

arguments @ { config, pkgs, lib, machine-settings, ... } : ( builtins.trace "Loading: ${toString ./.}..." { 
    
    programs.home-manager.enable = true;
    home = {

        file."test.txt.hom".text = "This is a rebrand!";
        stateVersion = "24.05";
    };    
})
