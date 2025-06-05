> This module is for programs in the shell category.

[< Back to the CLI README](../README.md)

# Shells

- [Shells](#shells)
  - [Overview](#overview)
  - [Module Settings](#module-settings)
  - [External Resources](#external-resources)

## Overview

Shells are programs that let you interact with your operating system by typing commands.

When you open a terminal, you're usually using a shell. It takes your input, runs the appropriate programs, and shows the output. Think of it as a translator between you and the system. Shells also let you write scripts: sequences of commands saved in files. These can automate tasks like file backups, installing software, or running tests. But I am assuming you know all of that already...

This module configures the following shells:

- [BASH](./bash/README.md): the most common on Linux,
- [Fish](./fish/README.md): designed to be user-friendly,
- [NuShell](./nushell/README.md): designed to parse data in all forms,

<!-- - zsh: similar to bash but with more features and plugins, -->

<!-- - sh: a minimal, portable shell, -->

<!-- - dash: often used for faster script execution in system tasks. -->

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
  cli.shells.enable = bool; # Defaults to `cli.enable`.
}
```

## External Resources

- [The list of home-manager options](https://home-manager-options.extranix.com/?query=programs.) for more information about settings and configuration if you want to change this module or its submodules.
