## The file to import if you want to import all my dotfiles.

arguments @ { config, pkgs, lib, machine-settings, ... } : ( builtins.trace "(HM) Loading: ${toString ./.}..." { 
  imports = [
    ./development
    ./editors
    ./gui
    ./shells
    ./terminals
  ];

  home.sessionVariables = {
    TEST = "THIS IS A TEST";
    TERMINAL = "kitty";
    EDITOR = "micro";
    BROWSER = "firefox";
    VISIAL = "code";
  };
})
