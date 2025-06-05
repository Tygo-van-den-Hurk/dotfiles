> This module is for direnv, a shell extension that executes code in directories automatically upon entering.

[< Back to the miscellaneous category README](../README.md)

# Direnv

- [Direnv](#direnv)
  - [Overview](#overview)
  - [Module Settings](#module-settings)
  - [External Resources](#external-resources)

## Overview

Direnv is a shell extension that automatically loads and unloads environment variables based on the current directory. It works with `.envrc` files and is useful for managing per-project environments, especially in development setups. It works really well with nix.

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
  cli.miscellaneous.direnv.enable = bool; # Defaults to `cli.miscellaneous.enable`.
}
```

## External Resources

- [Direnv GitHub Repository](https://github.com/direnv/direnv) for source, configuration, and usage examples.
- [The list of home-manager options](https://home-manager-options.extranix.com/?query=programs.direnv) for more information about settings and configuration if you want to change this module.
