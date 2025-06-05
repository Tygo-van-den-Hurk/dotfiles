> This module is about Yazi plugins.

[< Back to general Yazi README...](../README.md)

# Yazi Plugins

- [Yazi Plugins](#yazi-plugins)
  - [Overview](#overview)
  - [Plugins](#plugins)
  - [External Resources](#external-resources)

## Overview

[Yazi](https://github.com/yazi-rs) supports plugins that extend its functionality. This can be anything from git integration to custom prompts. I've selected a couple plugins that seem useful to have.

## Plugins

- [git](./git/README.md): the git plugin provides a visual indicator of whether or not files have been modified within repositories.
- [lazygit](./lazygit/README.md): integrates the `lazygit` TUI interface into yazi for streamlined git operations.
- [ouch](./ouch/README.md): adds support for compressing and decompressing various archive formats easily, as well as viewing the contents inside.
- [restore](./restore/README.md): manages restoring files you've deleted.
- [starship](./starship/README.md): configures the Starship prompt to show at the top of your yazi interface, updating in real time.
- [sudo](./sudo/README.md): Allows you to do basic modifications of the file system using using sudo.

## External Resources

- [the yazi plugin documentation](https://yazi-rs.github.io/docs/plugins/overview) for more information and configuration,
- [the relevant home-manager options](https://home-manager-options.extranix.com/?query=programs.yazi.plugins) for how to configure plugins.
- as well as [nixpkgs](https://search.nixos.org/packages?query=yaziPlugins) for which ones are already available.
