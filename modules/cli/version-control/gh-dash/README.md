> This module is for `gh-delta`, a TUI to display a dashboard with pull requests and issues by filters you care about.

[< Back to the version control category README](../README.md)

# gh-dash

- [gh-dash](#gh-dash)
  - [Overview](#overview)
  - [Module Settings](#module-settings)
  - [External Resources](#external-resources)

## Overview

`gh-dash` is a dashboard with pull requests and issues for the gh cli.

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
  cli.version-control.gh-dash.enable = bool; # Defaults to `cli.version-control.enable`.
}
```

## External Resources

- [GitHub CLI Documentation](https://github.com/dlvhdr/gh-dash) for more information about the tool.
- [The list of home-manager options](https://home-manager-options.extranix.com/?query=programs.gh-delta) for options you can use to alter this module
