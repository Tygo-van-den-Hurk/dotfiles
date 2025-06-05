> This module is for programs in the terminal category.

[< Back to the GUI README](../README.md)

# Terminals

- [Terminals](#terminals)
  - [Overview](#overview)
  - [Module Settings](#module-settings)
  - [External Resources](#external-resources)

## Overview

A terminal is a text-based interface used to interact with the operating system. It allows you to run commands, manage files, control processes, and automate tasks through a shell like Bash, Zsh, or Fish. Terminals are essential tools for developers and system administrators, offering powerful control and scripting capabilities beyond what graphical interfaces provide.

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
  gui.terminals.enable = bool; # Defaults to `gui.enable`.
}
```

## External Resources

- [The list of home-manager options](https://home-manager-options.extranix.com) for more information about settings and configuration if you want to change this module or its submodules.
