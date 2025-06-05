> This module is for the Bash shell.

[< Back to the Shell category README](../README.md)

# Bash

- [Bash](#bash)
  - [Overview](#overview)
  - [Module Settings](#module-settings)
  - [External Resources](#external-resources)

## Overview

Bash (short for Bourne Again SHell) is one of the most widely used command-line shells on Unix-like systems. It acts as both a user interface and a scripting language.

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
  cli.shells.bash.enable = bool; # Defaults to `cli.shells.enable`.
}
```

## External Resources

- [The list of home-manager options](https://home-manager-options.extranix.com/?query=programs.bash) for more information about settings and configuration if you want to change this module.
