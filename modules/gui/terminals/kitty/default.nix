{
  lib,
  config,
  system,
  ...
}:
let
  inherit (lib) mkOption;
  inherit (lib) mkDefault;
  inherit (lib) mkIf;
  inherit (lib) types;
  inherit (lib) hasSuffix;

  inherit (types) bool;

  program = "kitty";
  category = "terminals";
  type = "gui";
in
{

  options.${type}.${category}.${program}.enable = mkOption {
    description = "Whether to enable ${program}'s default config.";
    default = config.${type}.${category}.enable;
    type = bool;
  };

  config.programs.${program} = mkIf config.${type}.${category}.${program}.enable {
    enable = mkDefault true;
    enableGitIntegration = mkDefault config.programs.git.enable;

    shellIntegration = {
      enableBashIntegration = mkDefault true;
      enableFishIntegration = mkDefault true;
      enableZshIntegration = mkDefault true;
      mode = mkDefault "no-rc";
    };

    keybindings =
      if (hasSuffix "linux" system) then
        {
          "ctrl+c" = mkDefault "copy_or_interrupt";
          "super+c" = mkDefault "signal_child SIGINT";
          "ctrl+v" = mkDefault "paste_from_clipboard";
        }
      else
        { };

    settings = {

      # general
      confirm_os_window_close = mkDefault "0";
      copy_on_select = mkDefault "no";
      enable_audio_bell = mkDefault "yes";

      # looks
      padding_width = mkDefault "0";

      # Cursors
      cursor_shape = mkDefault "beam";
      cursor_shape_unfocused = mkDefault "hollow";

      # URLs
      detect_urls = mkDefault "yes";
      open_url_with = mkDefault "default";
      underline_hyperlinks = mkDefault "always";
    };
  };
}
