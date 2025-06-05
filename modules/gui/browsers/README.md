> This module is for file viewers.

[< Back to the GUI README](../README.md)

# File viewers

- [File viewers](#file-viewers)
  - [Overview](#overview)
  - [Module Settings](#module-settings)
  - [Programs](#programs)
  - [External Resources](#external-resources)

## Overview

File viewers are just programs you can use to open and view files.

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
  gui.file-viewers.enable = bool; # Defaults to `gui.enable`.
}
```

## Programs

- [MPV](./mpv/README.md) a video viewer.
- [Thunar](./thunar/README.md) a standard file viewer.
- [Zathura](./zathura/README.md) a PDF viewer.

## External Resources

- [The list of home-manager options](https://home-manager-options.extranix.com) for more information about settings and configuration if you want to change this module or its submodules.
