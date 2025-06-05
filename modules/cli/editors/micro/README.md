> This module is for Micro text editor.

# Micro

- [Micro](#micro)
  - [Overview](#overview)
  - [Module Settings](#module-settings)
  - [External Resources](#external-resources)

## Overview

micro is a terminal-based text editor that aims to be easy to use and intuitive, while also taking advantage of the capabilities of modern terminals.

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
  cli.editors.micro.enable = bool; # Defaults to `cli.editors.enable`.
  cli.editors.micro.mkDefault = bool; # Defaults to `cli.editors.micro.enable`.
}
```

## External Resources

- [The Micro GitHub repository](https://github.com/zyedidia/micro) for source code, configuration and documentation.
- [The list of home-manager options](https://home-manager-options.extranix.com) for more information about settings and configuration if you want to change this module or its submodules.
