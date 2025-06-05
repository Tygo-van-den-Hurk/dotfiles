> This module is for programs in the Window Manager category.

[< Back to the GUI README](../README.md)

# Window Managers

- [Window Managers](#window-managers)
  - [Overview](#overview)
  - [Module Settings](#module-settings)
  - [External Resources](#external-resources)

## Overview

A

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
  gui.window-managers.enable = bool; # Defaults to `gui.enable`.
}
```

## External Resources

- [The list of home-manager options](https://home-manager-options.extranix.com) for more information about settings and configuration if you want to change this module or its submodules.
