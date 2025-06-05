> This repository will be used as a template for future school projects.

<br>
<div align="center">
    <a href="https://nixos.org">
      <img src="https://img.shields.io/badge/Built_With-Nix-5277C3.svg?style=flat&logo=nixos&labelColor=73C3D5" alt="Built with Nix"/>
    </a>
    <a href="https://containers.dev/">
      <img src="https://img.shields.io/badge/devcontainer-provided-dark_green?style=flat&logo=docker&logoColor=BEC5C9" alt="devcontainer provided"/>
    </a>
    <!--~ Repository CI/CD ~-->
    <a href="https://github.com/Tygo-van-den-Hurk/dotfiles/actions/workflows/deploy-github-pages.yml">
      <img src="https://img.shields.io/github/actions/workflow/status/Tygo-van-den-Hurk/dotfiles/deploy-github-pages.yml?style=flat&logo=GitHub%20Actions&logoColor=BEC5C9&label=Deploy" alt="GitHub Deployment status">
    </a>
    <a href="https://github.com/Tygo-van-den-Hurk/dotfiles/actions/workflows/nix-flake-check.yml">
      <img src="https://img.shields.io/github/actions/workflow/status/Tygo-van-den-Hurk/dotfiles/nix-flake-check.yml?style=flat&logo=GitHub%20Actions&logoColor=BEC5C9&label=CI/CD" alt="GitHub CI/CD status">
    </a>
    <!--~ Repository Statistics ~-->
    <a href="https://github.com/Tygo-van-den-Hurk/dotfiles/graphs/contributors">
      <img src="https://img.shields.io/github/contributors/Tygo-van-den-Hurk/dotfiles?style=flat" alt="Contributors"/>
    </a>
    <a href="https://github.com/Tygo-van-den-Hurk/dotfiles/blob/main/LICENSE">
      <img src="https://img.shields.io/github/license/Tygo-van-den-Hurk/dotfiles?style=flat" alt="The Eclipse Public License v2.0 badge" />
    </a>
    <a href="https://github.com/Tygo-van-den-Hurk/dotfiles/commit">
      <img src="https://badgen.net/github/commits/Tygo-van-den-Hurk/dotfiles?style=flat" alt="GitHub commits" />
    </a>
    <a href="https://github.com/Tygo-van-den-Hurk/dotfiles/commit">
      <img src="https://badgen.net/github/last-commit/Tygo-van-den-Hurk/dotfiles?style=flat" alt="GitHub latest commit" />
    </a>
    <a href="https://github.com/Tygo-van-den-Hurk/dotfiles/network/">
      <img src="https://badgen.net/github/forks/Tygo-van-den-Hurk/dotfiles?style=flat" alt="GitHub forks" />
    </a>
    <a href="https://github.com/Tygo-van-den-Hurk/dotfiles/">
      <img src="https://img.shields.io/github/languages/count/Tygo-van-den-Hurk/dotfiles?style=flat" alt="amount of languages in the repository" />
    </a>   
    <a href="https://github.com/Tygo-van-den-Hurk/dotfiles/stargazers">
      <img src="https://img.shields.io/github/stars/Tygo-van-den-Hurk/dotfiles?style=flat" alt="amount of stars" />
    </a>
    <!--~ Repository Updates ~-->
    <a href="https://github.com/Tygo-van-den-Hurk/dotfiles/pulse">
      <img src="https://img.shields.io/github/created-at/Tygo-van-den-Hurk/dotfiles?style=flat" alt="created at badge" />
    </a>
    <a href="https://github.com/Tygo-van-den-Hurk/dotfiles/releases">
      <img src="https://img.shields.io/github/release/Tygo-van-den-Hurk/dotfiles?style=flat&display_name=release" alt="newest release" />
    </a>
    <a href="https://github.com/Tygo-van-den-Hurk/dotfiles/">
      <img src="https://img.shields.io/github/repo-size/Tygo-van-den-Hurk/dotfiles?style=flat" alt="the size of the repository" />
    </a>   
</div>
<br>

# Dotfiles

- [Dotfiles](#dotfiles)
  - [Overview](#overview)
  - [How to use](#how-to-use)
  - [Credits](#credits)
  - [Licence](#licence)

## Overview

This repository contains the the configuration files for applications. It will use [Nix Home Manager](https://github.com/nix-community/home-manager).

## How to use

To use these configurations see if there is a config ready for the current machine / user combo.

```Sh
./configurations/$(whoami)@$(hostname)/
```

## Credits

- Tygo van den Hurk \<[@Tygo-van-den-Hurk](https://redirects.tygo.van.den.hurk.dev/github/personal/)>

To see how to start or develop see [CONTRIBUTING.md](./CONTRIBUTING.md).

## Licence

All files within this repository fall under a licence. See [LICENCE](./LICENSE) for more information.
