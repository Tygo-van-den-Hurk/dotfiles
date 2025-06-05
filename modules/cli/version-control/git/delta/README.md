> This module is for Git Delta, a syntax-highlighting pager for Git.

[< Back to the git module README](../README.md)

# Git Delta

- [Git Delta](#git-delta)
  - [Overview](#overview)
  - [Module Settings](#module-settings)
  - [External Resources](#external-resources)

## Overview

Git Delta (`delta`) is a syntax-highlighting pager for Git, used to improve the readability of diffs and logs in the terminal. It adds color, syntax highlighting, line numbers, side-by-side diffs, and more—making code reviews and history inspection easier and more pleasant.

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
  cli.version-control.git.delta.enable = bool; # Defaults to `cli.version-control.git.enable`.
}
```

## External Resources

- [GitHub Repository](https://github.com/dandavison/delta) for source, issues, and documentation.
- [The list of home-manager options](https://home-manager-options.extranix.com/?query=programs.git.delta) for options you can use to alter this helper module.
