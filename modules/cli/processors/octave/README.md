> This module is for the CLI tool called `octave`.

[< Back to processors category README](../README.md)

# Octave

- [Octave](#octave)
  - [Overview](#overview)
  - [Module Settings](#module-settings)
  - [External Resources](#external-resources)

## Overview

GNU Octave is a high-level programming language designed for numerical computing. It’s mostly used for solving linear and nonlinear problems, doing numerical experiments, and visualizing data. Its syntax is very similar to MATLAB, so much so that many MATLAB scripts can run in Octave with little or no modification.

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
  cli.processors.octave.enable = bool; # Defaults to `cli.processors.enable`.
}
```

## External Resources

- [The Octave GitHub repository](https://github.com/gnu-octave/octave) for more information about the tool.
