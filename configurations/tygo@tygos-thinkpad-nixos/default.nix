{
  inputs,
  outputs,
  system,
  config,
  ...
}:

{
  imports = [
    inputs.self.outputs.homeManagerModules.cli
    inputs.self.outputs.homeManagerModules.gui
    inputs.self.outputs.homeManagerModules.styling
    inputs.stylix.homeModules.stylix
  ];

  programs.home-manager.enable = true;

  # State variables
  home.username = "tygo";
  home.homeDirectory = "/home/tygo";
  home.stateVersion = "25.05";

  # Add all packages from the 'pkgs' directory.
  home.packages = map (package: inputs.self.packages.${system}.${package}) (
    builtins.attrNames inputs.self.packages.${system}
  );

  # Bug fixes: https://github.com/alacritty/alacritty/issues/5101q
  home.sessionVariables.WINIT_X11_SCALE_FACTOR = 1;
  xdg.mimeApps.enable = true;

  # Custom Modules
  styling.enable = true;
  cli.enable = true;
  cli.miscellaneous.zellij.enable = false;
  gui.enable = true;
  gui.monitors = {
    "eDP-1" = {
      primary = true;
      refresh-rate = 60;
      resolution.vertical = 1080;
      resolution.horizontal = 1920;
      # placement.what = "eDP-1";
      # placement.where = "mirror";
    };
    "HDMI-1" = {
      primary = false;
      refresh-rate = 60;
      resolution.vertical = 1080 * 2;
      resolution.horizontal = 1920 * 2;
      placement.what = "eDP-1";
      placement.where = "above";
    };
  };

  home.file.".config/monitors.json".text = builtins.toJSON config.gui.monitors;
  home.file.".config/workspaces.json".text = builtins.toJSON config.gui.window-managers.workspaces;
}
