> This module is for Hyprland a Wayland window manager.

[< Back to the Window Manager README](../README.md)

# Hyprland

- [Hyprland](#hyprland)
  - [Overview](#overview)
  - [Module Settings](#module-settings)
  - [External Resources](#external-resources)

## Overview

Hyprland is a 100% independent, dynamic tiling Wayland compositor that doesn't sacrifice on its looks. It provides the latest Wayland features, is highly customizable, has all the eye candy, the most powerful plugins, easy IPC, much more QoL stuff than other compositors and more...

## Module Settings

These are the settings for this module:

```Nix
{ 
  lib,
  ... 
}:
let 
  inherit (lib) types;
  inherit (types) bool;
in 
{
  gui.window-managers.hyprland.enable = bool; # Defaults to `gui.window-managers.enable`.
}
```

## External Resources

- [The Hyprland wiki](https://wiki.hypr.land/) for more information on how to configure this window manager.
- [The list of home-manager options](https://home-manager-options.extranix.com) for more information about settings and configuration if you want to change this module or its submodules.
