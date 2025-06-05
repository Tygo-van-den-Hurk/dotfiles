> This module is for the CLI tool called `jqp`.

[< Back to processors category README](../README.md)

# JQP

- [JQP](#jqp)
  - [Overview](#overview)
  - [Module Settings](#module-settings)
  - [External Resources](#external-resources)

## Overview

JQP is a TUI playground for exploring [JQ](https://github.com/jqlang/jq). It allow for fast and easy script writing.

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
  cli.processors.jqp.enable = bool; # Defaults to `cli.processors.enable`.
}
```

## External Resources

- [The JQP GitHub repository](https://github.com/noahgorstein/jqp) for more information about the tool.
- [The JQ GitHub repository](https://github.com/jqlang/jq) for more information on the language and syntax.
- [The list of home-manager options](https://home-manager-options.extranix.com/?query=programs.jqp) for more information about settings and configuration if you want to change this module.
