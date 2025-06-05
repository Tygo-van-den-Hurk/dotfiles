> This module is for TUI File managers.

# File Managers

- [File Managers](#file-managers)
  - [Overview](#overview)
  - [Programs](#programs)
  - [Module Settings](#module-settings)
  - [External Resources](#external-resources)

## Overview

File managers are applications that allow you to traverse the file tree and edit it as you see fit using a sort of table layout.

## Programs

- [Ranger](./ranger/README.md)
- [Yazi](./yazi/README.md)

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
  cli.file-managers.enable = bool; # Defaults to `cli.enable`.
}
```

## External Resources

- [The list of home-manager options](https://home-manager-options.extranix.com) for more information about settings and configuration if you want to change this module or its submodules.
