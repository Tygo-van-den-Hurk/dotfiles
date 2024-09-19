## The configuration of the Kitty terminal

arguments @ { config, pkgs, lib, machine-settings, ... } : ( builtins.trace "(Tygo's HM) Loading: ${toString ./.}..." { 
  
  # TODO : FIX accents
  stylix.targets.kitty.enable = false;

  programs.kitty = { 
    
    enable = true;
    
    font = {
      name = lib.mkDefault "OpenDyslexicM Nerd Font Mono";
      package = lib.mkDefault pkgs.nerdfonts;
      size = lib.mkDefault 12;
    };

    settings = {
      cursor_shape = lib.mkDefault "beam";
      cursor_shape_unfocused = lib.mkDefault "hollow";
      confirm_os_window_close = lib.mkDefault 0;
      update_check_interval = lib.mkDefault 0;
      tab_bar_margin_height = lib.mkDefault "0.0 0.0";
      window_padding_width = lib.mkDefault "0 0 0 0";
      placement_strategy = lib.mkDefault "top-left";
    };

    # You can also pass a custom config file
    extraConfig = lib.mkDefault (''
      # End of the file
    '');
  };
})
