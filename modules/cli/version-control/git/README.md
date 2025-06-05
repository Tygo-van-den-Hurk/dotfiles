> This module is for Git, the distributed version control system.

[< Back to the version control category README](../README.md)

# Git

- [Git](#git)
  - [Overview](#overview)
  - [Module Settings](#module-settings)
  - [Helpers](#helpers)
  - [External Resources](#external-resources)

## Overview

Git is a fast, distributed version control system used to track changes in source code and coordinate work between developers. It allows branching, merging, and history tracking, making it the backbone of most modern software development workflows.

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
  cli.version-control.git.enable = bool; # Defaults to `cli.version-control.enable`.
}
```

## Helpers

This module has a helper called [delta](./delta/README.md). [Git delta](https://github.com/dandavison/delta) is a syntax-highlighting pager for Git, used to improve the readability of diffs and logs in the terminal. It adds color, syntax highlighting, line numbers, side-by-side diffs, and more making code reviews and history inspection easier and more pleasant.

## External Resources

- [Git Documentation](https://git-scm.com/doc) for guides, manuals, and reference material.
- [The list of home-manager options](https://home-manager-options.extranix.com/?query=programs.git) for options you can use to alter this module.
