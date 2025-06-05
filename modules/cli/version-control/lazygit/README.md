> This module is for Lazygit, a terminal UI for Git.

[< Back to the version control category README](../README.md)

# Lazygit

- [Lazygit](#lazygit)
  - [Overview](#overview)
  - [Module Settings](#module-settings)
  - [External Resources](#external-resources)

## Overview

Lazygit is a simple, fast, and feature-rich terminal UI for Git. It provides a visual interface to manage commits, branches, stashes, remotes, and more—all from the command line. It’s especially useful for quickly resolving merge conflicts and reviewing changes.

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
  cli.version-control.lazygit.enable = bool; # Defaults to `cli.version-control.enable`.
}
```

## External Resources

- [Lazygit Documentation](https://github.com/jesseduffield/lazygit) for usage instructions, features, and documentation.
- [The list of home-manager options](https://home-manager-options.extranix.com/?query=programs.lazygit) for options you can use to alter this module.
