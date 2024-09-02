## The file to import if you want to import all my dotfiles.

arguments @ { config, pkgs, lib, machine-settings, ... } : ( builtins.trace "Loading: ${toString ./.}..." { 
  imports = [
    ./development
    ./editors
    ./gui
    ./shells
    ./terminals
  ];

  home.sessionVariables = {
    EDITOR = "";
    BROWSER = "";
    VISIAL = "";
  };
})
