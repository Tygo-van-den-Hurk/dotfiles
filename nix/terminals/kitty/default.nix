## The configuration of the Kitty terminal

arguments @ { config, pkgs, lib, machine-settings, ... } : ( builtins.trace "(HM) Loading: ${toString ./.}..." { 
  programs.kitty = { 
    
    enable = true;
    
    font = {
      name = "OpenDyslexicM Nerd Font Mono";
      package = pkgs.open-dyslexic;
      size = 12;
    };

    settings = {
      cursor_shape = "beam";
      cursor_shape_unfocused = "hollow";
      confirm_os_window_close = 0;

      tab_bar_margin_height = "0.0 0.0";
      window_padding_width = "0 0 0 0";
      placement_strategy = "top-left";
    };

    # You can also pass a custom config file
    extraConfig = ''
      # TEST
    '';
  };
})
