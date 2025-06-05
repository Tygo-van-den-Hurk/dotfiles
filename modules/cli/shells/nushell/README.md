> This module is for the Nushell shell.

[< Back to the Shell category README](../README.md)

# Nushell

- [Nushell](#nushell)
  - [Overview](#overview)
  - [Module Settings](#module-settings)
  - [External Resources](#external-resources)

## Overview

Nushell is a modern shell built around structured data. Unlike traditional shells that pass around raw text, Nushell works with tables and rich data types by default. It’s designed for clarity, safety, and composability, but uses a custom scripting language that’s not POSIX-compatible.

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
  cli.shells.nushell.enable = bool; # Defaults to `cli.shells.enable`.
}
```

## External Resources

- [The list of home-manager options](https://home-manager-options.extranix.com/?query=programs.nushell) for more information about settings and configuration if you want to change this module.
