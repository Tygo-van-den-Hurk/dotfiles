> This module is for Glow markdown editor.

# Glow

- [Glow](#glow)
  - [Overview](#overview)
  - [Module Settings](#module-settings)
  - [External Resources](#external-resources)

## Overview

Glow is a terminal based markdown reader designed from the ground up to bring out the beauty and power of the CLI. Use it to discover markdown files, read documentation directly on the command line. Glow will find local markdown files in subdirectories or a local Git repository.

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
  cli.editors.glow.enable = bool; # Defaults to `cli.editors.enable`.
}
```

## External Resources

- [The glow GitHub repository](https://github.com/charmbracelet/glow) for source code, configuration and documentation.
- [The list of home-manager options](https://home-manager-options.extranix.com) for more information about settings and configuration if you want to change this module or its submodules.
