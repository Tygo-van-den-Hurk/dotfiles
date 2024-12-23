# dotfiles
This repository contains the the configuration files for applications. It will use GNU stow to make a link to the home directory to keep the home directory clean. Though I am trying to house all my config files over to [Nix Home Manager](https://github.com/nix-community/home-manager). 

Home Manager has some quirks however. For example, it must be committed for the changes to be used in a rebuild unlike the system rebuild where this isn't the case. Though I am fairly certain that's because of the weird way I'm using it right now.
