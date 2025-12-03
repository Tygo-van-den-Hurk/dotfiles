{
  description = "The flake used for building, checking and developing this school project.";

  inputs = {

    nixpkgs.url = "github:nixos/nixpkgs/nixos-25.11";
    nixpkgs-unstable.url = "github:nixos/nixpkgs/nixos-unstable";

    nix-github-actions.url = "github:nix-community/nix-github-actions";

    flake-utils.url = "github:numtide/flake-utils";
    systems.url = "github:nix-systems/default";

    pre-commit-hooks = {
      url = "github:cachix/git-hooks.nix";
      inputs = {
        flake-compat.follows = "flake-compat";
        nixpkgs.follows = "nixpkgs";
      };
    };

    flake-compat = {
      url = "github:edolstra/flake-compat";
      flake = false;
    };

    treefmt-nix = {
      url = "github:numtide/treefmt-nix";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    home-manager = {
      url = "github:nix-community/home-manager/release-25.11";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    stylix = {
      url = "github:nix-community/stylix/release-25.11";
      inputs = {
        systems.follows = "systems";
      };
    };
  };

  outputs =
    inputs:
    {

      overlays = import ./overlays inputs;

      homeManagerModules = import ./modules (inputs // { inherit (inputs.nixpkgs) lib; });

      githubActions = inputs.nix-github-actions.lib.mkGithubMatrix {
        checks = inputs.nixpkgs.lib.getAttrs (import inputs.systems) (
          # check whether the packages can be build for every platform,
          # but for linux also do the other checks. Prevents duplicated
          # checking for non-package builds.
          inputs.self.packages // { inherit (inputs.self.checks) x86_64-linux; }
        );
      };
    }
    // inputs.flake-utils.lib.eachDefaultSystem (
      system:
      let

        treefmtEval = inputs.treefmt-nix.lib.evalModule pkgs ./.config/treefmt.nix;
        pre-commit-check = inputs.pre-commit-hooks.lib.${system}.run (import ./.config/pre-commit.nix);

        pkgs = import inputs.nixpkgs {
          inherit system;
          overlays = [
            inputs.self.overlays.add-flake-pkgs
            inputs.self.overlays.add-unstable-nixpkgs
            inputs.self.overlays.custom-overlays
          ];
        };

      in
      rec {
        # ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ Nix Fmt ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ #

        formatter = treefmtEval.config.build.wrapper;

        # ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ Nix Build ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ #

        packages = import ./pkgs pkgs;

        # ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ Nix Flake Check ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ #

        checks = packages // {
          formatting = treefmtEval.config.build.check inputs.self;
          inherit pre-commit-check;
        };

        # ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ Nix Develop ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ #

        devShells.default = pkgs.mkShell {
          inherit (pre-commit-check) shellHook;
          buildInputs =
            pre-commit-check.enabledPackages
            ++ (map (package: inputs.self.packages.${system}.${package}) (builtins.attrNames packages))
            ++ (with inputs; [
              inputs.home-manager.packages.${system}.home-manager
            ])
            ++ (with pkgs; [
              git-cliff # generate release notes.
              act # Run / check GitHub Actions locally.
              git # Pull, commit, and push changes.
            ]);
        };

        # ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ Nix Run ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ #

        apps = rec {
          default = switch;
          switch = {
            type = "app";
            program = builtins.toString (
              let
                home-manager-bin = "${inputs.home-manager.packages.${system}.home-manager}/bin/home-manager";
              in
              pkgs.writeShellScript "switch" ''
                username="$(whoami)"
                hostname="$(hostname)"
                flake="$(git rev-parse --show-toplevel)"
                configuration="$flake#$username@$hostname"
                echo "Switching to configuration: $configuration"
                ${home-manager-bin} switch --show-trace -b backup "$@" --flake $configuration
              ''
            );
          };
        };

        # ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ Home-Manager Switch ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ #

        legacyPackages.homeConfigurations =
          let

            mkHomeConfiguration =
              name:
              inputs.home-manager.lib.homeManagerConfiguration {
                inherit pkgs;

                extraSpecialArgs = {
                  inherit inputs system;
                  inherit (inputs.self) outputs;
                };

                modules = [
                  "${./.}/configurations/${name}"
                ];
              };

          in
          rec {
            "tygo@thinkpad" = "tygo@tygos-thinkpad-nixos";
            "tygo@tygos-thinkpad" = "tygo@tygos-thinkpad-nixos";
            "tygo@tygos-thinkpad-nixos" = mkHomeConfiguration "tygo@tygos-thinkpad-nixos";
          };

        # ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ #
      }
    );
}
