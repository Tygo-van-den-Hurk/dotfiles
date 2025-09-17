> This module is for the CLI tool called `qalc`.

[< Back to processors category README](../README.md)

# qalc

- [qalc](#qalc)
  - [Overview](#overview)
  - [Module Settings](#module-settings)
  - [External Resources](#external-resources)

## Overview

`qalc` is the command-line interface of Qalculate!, a powerful calculator supporting arbitrary precision arithmetic, symbolic calculations, unit conversions, plotting, and more. It offers an interactive mode with history and autocompletion, making it suitable for both quick calculations and scripting.

## Module Settings

These are the settings for this module:

```nix
{ 
  lib,
  ... 
}:
let 
  inherit (lib) types;
  inherit (types) bool;
in 
{
  cli.processors.qalc.enable = bool; # Defaults to `cli.processors.enable`.
}
```

## External Resources

- [Qalculate! Manual](https://qalculate.github.io/manual/qalc.html) for more information about the tool.
- [Qalculate! GitHub Repository](https://github.com/Qalculate/libqalculate) for more issues or bugs.
