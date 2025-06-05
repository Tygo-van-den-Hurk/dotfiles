> This module is for Hyprland a Wayland window manager.

[< Back to the Window Manager README](../README.md)

# i3

- [i3](#i3)
  - [Overview](#overview)
  - [Module Settings](#module-settings)
  - [External Resources](#external-resources)

## Overview

i3 is a tiling window manager, completely written from scratch. The target platforms are GNU/Linux and BSD operating systems, our code is Free and Open Source Software (FOSS) under the BSD license. i3 is primarily targeted at advanced users and developers.

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
  gui.window-managers.i3.enable = bool; # Defaults to `gui.window-managers.enable`.
}
```

## External Resources

- [The i3 wiki](https://i3wm.org/docs) for more information on how to configure this window manager.
- [The list of home-manager options](https://home-manager-options.extranix.com) for more information about settings and configuration if you want to change this module or its submodules.
