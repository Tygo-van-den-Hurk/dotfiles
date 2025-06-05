> This module is for programs that did not fit into any other category.

[< Back to CLI README](../README.md)

# Miscellaneous

- [Miscellaneous](#miscellaneous)
  - [Overview](#overview)
  - [Programs](#programs)
  - [Module Settings](#module-settings)
  - [External Resources](#external-resources)

## Overview

This module is for programs that did not fit into any other category.

## Programs

- []

<!-- TODO: add... -->

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
  cli.miscellaneous.enable = bool; # Defaults to `cli.enable`.
}
```

## External Resources

- [The list of home-manager options](https://home-manager-options.extranix.com) for more information about settings and configuration if you want to change this module or its submodules.
