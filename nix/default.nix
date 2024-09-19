## The file to import if you want to import all my dotfiles.

arguments @ { config, pkgs, lib, machine-settings, ... } : ( builtins.trace "(Tygo's HM) Loading: ${toString ./.}..." { 
  
  imports = [
    ./development
    ./editors
    ./gui
    ./gui-toolkits
    ./shells
    ./terminals
  ];
  
  stylix = { 
    
    cursor = {
      package = pkgs.whitesur-cursors; # apple-cursor;
      name = "macOS-BigSur"; # "macOS-Monterey";
    };  

    enable = true;
    image = ../.config/assets/images/wallpapers/default.jpg;
    polarity = "dark";
    
    # fonts = {
    #   serif = {
    #     package = pkgs.dejavu_fonts;
    #     name = "DejaVu Serif";
    #   };
    #   sansSerif = {
    #     package = pkgs.dejavu_fonts;
    #     name = "DejaVu Sans";
    #   };
    #   monospace = {
    #     package = pkgs.dejavu_fonts;
    #     name = "DejaVu Sans Mono";
    #   };
    #   emoji = {
    #     package = pkgs.noto-fonts-emoji;
    #     name = "Noto Color Emoji";
    #   };
    # };
  };

  home = {

    packages = with pkgs; [
      btop
    ];
  
    sessionVariables = {
      TERMINAL = "kitty";
      EDITOR = "micro";
      BROWSER = "firefox";
      VISIAL = "code";
    };
  };
})
