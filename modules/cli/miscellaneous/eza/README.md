> This module is for Eza, a modern alternative to `ls` with more features and better formatting.

[< Back to the miscellaneous category README](../README.md)

# Eza

- [Eza](#eza)
  - [Overview](#overview)
  - [Module Settings](#module-settings)
  - [External Resources](#external-resources)

## Overview

Eza is a modern replacement for `ls` that adds colors, icons, Git integration, and better formatting for file listings. It supports features like tree views, file metadata, and sorting options that make it easier to inspect and navigate directories in the terminal.

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
  cli.miscellaneous.eza.enable = bool; # Defaults to `cli.miscellaneous.enable`.
}
```

## External Resources

- [Eza GitHub Repository](https://github.com/eza-community/eza) for source, configuration tips, and examples.
- [The list of home-manager options](https://home-manager-options.extranix.com/?query=programs.eza) for more information about settings and configuration if you want to change this module.
