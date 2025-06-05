> This module is for slack-term, a terminal-based client for Slack.

[< Back to the miscellaneous category README](../README.md)

# Slack-term

- [Slack-term](#slack-term)
  - [Overview](#overview)
  - [Module Settings](#module-settings)
  - [External Resources](#external-resources)

## Overview

Slack-term is a terminal-based Slack client that allows you to communicate in Slack workspaces directly from your terminal. It supports reading and sending messages, browsing channels, and more, making it useful for developers who prefer staying in the terminal environment.

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
  cli.miscellaneous.slack-term.enable = bool; # Defaults to `cli.miscellaneous.enable`.
}
```

## External Resources

- [The Slack Term GitHub Repository](https://github.com/jpbruinsslot/slack-term) for source, configuration tips, and examples.
- [The list of home-manager options](https://home-manager-options.extranix.com/?query=programs.bat) for more information about settings and configuration if you want to change this module.
