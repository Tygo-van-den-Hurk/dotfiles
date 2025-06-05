> This module is for Bat, a modern alternative to `cat` with syntax highlighting.

[< Back to the miscellaneous category README](../README.md)

# Bat

- [Bat](#bat)
  - [Overview](#overview)
  - [Module Settings](#module-settings)
  - [External Resources](#external-resources)

## Overview

Bat is a drop-in replacement for `cat` that adds syntax highlighting, Git integration, and paging. It’s useful for viewing code and text files with color and context, directly in the terminal. Bat automatically detects file types and can be used as a pager for many other tools.

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
  cli.miscellaneous.bat.enable = bool; # Defaults to `cli.miscellaneous.enable`.
}
```

## External Resources

- [Bat GitHub Repository](https://github.com/sharkdp/bat) for source, configuration tips, and examples.
- [The list of home-manager options](https://home-manager-options.extranix.com/?query=programs.bat) for more information about settings and configuration if you want to change this module.
