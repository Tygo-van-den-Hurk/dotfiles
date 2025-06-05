> This module is for the CLI tool called `jq`.

[< Back to processors category README](../README.md)

# JQ

- [JQ](#jq)
  - [Overview](#overview)
  - [Module Settings](#module-settings)
  - [External Resources](#external-resources)

## Overview

`jq` is a lightweight and flexible command-line JSON processor akin to `sed`, `awk`, `grep`, and friends for JSON data. It's written in portable C and has zero runtime dependencies, allowing you to easily slice, filter, map, and transform structured data.

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
  cli.processors.jq.enable = bool; # Defaults to `cli.processors.enable`.
}
```

## External Resources

- [The JQ GitHub repository](https://github.com/jqlang/jq) for more information on the language and syntax.
- [The list of home-manager options](https://home-manager-options.extranix.com/?query=programs.jq) for more information about settings and configuration if you want to change this module.
