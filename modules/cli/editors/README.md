> This module is for TUI File editors.

# Editors

- [Editors](#editors)
  - [Overview](#overview)
  - [Programs](#programs)
  - [Module Settings](#module-settings)
  - [External Resources](#external-resources)

## Overview

<!-- TODO: Fill in -->

## Programs

- [Glow](./glow/README.md) a tui markdown editor.

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
  cli.editors.enable = bool; # Defaults to `cli.enable`.
}
```

## External Resources

- [The list of home-manager options](https://home-manager-options.extranix.com) for more information about settings and configuration if you want to change this module or its submodules.
