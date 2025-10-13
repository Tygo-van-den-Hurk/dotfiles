> This module is for the Zsh shell.

[< Back to the Shell category README](../README.md)

# Zsh

- [Zsh](#zsh)
  - [Overview](#overview)
  - [Module Settings](#module-settings)
  - [External Resources](#external-resources)

## Overview

Zsh (short for Z Shell) is an extended Bourne-like shell with many improvements over Bash, including better tab completion, spelling correction, plugin systems, and themes. It is popular among developers for its flexibility and customization options.

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
  cli.shells.zsh.enable = bool; # Defaults to `cli.shells.enable`.
}
```

## External Resources

- [The list of home-manager options](https://home-manager-options.extranix.com/?query=programs.zsh) for more information about settings and configuration if you want to change this module.
