> This module is for the GitHub CLI (`gh`).

[< Back to the version control category README](../README.md)

# GitHub CLI

- [GitHub CLI](#github-cli)
  - [Overview](#overview)
  - [Module Settings](#module-settings)
  - [External Resources](#external-resources)

## Overview

The GitHub CLI (`gh`) is an official command-line tool for interacting with GitHub from your terminal. It supports issues, pull requests, releases, browsing repositories, and more without needing to open a browser. It's designed to make GitHub workflows feel native in the shell.

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
  cli.version-control.gh.enable = bool; # Defaults to `cli.version-control.enable`.
}
```

## External Resources

- [GitHub CLI Documentation](https://cli.github.com/manual/) for more information about the tool.
- [The list of home-manager options](https://home-manager-options.extranix.com/?query=programs.gh) for options you can use to alter this module
