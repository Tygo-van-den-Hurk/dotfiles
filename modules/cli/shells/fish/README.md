> This module is for the Fish shell.

[< Back to the Shell category README](../README.md)

# Fish

- [Fish](#fish)
  - [Overview](#overview)
  - [Module Settings](#module-settings)
  - [External Resources](#external-resources)

## Overview

Fish (Friendly Interactive SHell) is a modern Unix shell focused on user-friendliness and simplicity. It has smart suggestions, syntax highlighting, and works out-of-the-box without needing much configuration. Unlike Bash, its scripting syntax is more readable but not POSIX-compliant.

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
  cli.shells.fish.enable = bool; # Defaults to `cli.shells.enable`.
}
```

## External Resources

- [The list of home-manager options](https://home-manager-options.extranix.com/?query=programs.fish) for more information about settings and configuration if you want to change this module.
