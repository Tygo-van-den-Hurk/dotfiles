> This module is for tools used for processing in the CLI.

[< Back to CLI category README](../README.md)

# Processors

- [Processors](#processors)
  - [Overview](#overview)
  - [Programs](#programs)
  - [Module Settings](#module-settings)
  - [External Resources](#external-resources)

## Overview

Processors are tools that specialize in transforming one kind of data into another, often acting as building blocks for bigger command-line workflows.

## Programs

There are a couple of programs that fall under the processors category, those being:

- [JQ](./jq/README.md): a program for manipulating JSON data.
- [JQP](./jqp/README.md): a TUI playground for exploring [JQ](https://github.com/jqlang/jq).
- [Octave](./octave/README.md): a program for doing calculations

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
  cli.processors.enable = bool; # Defaults to `cli.enable`.
}
```

## External Resources

- [The list of home-manager options](https://home-manager-options.extranix.com) for more information about settings and configuration if you want to change this module or its submodules.
