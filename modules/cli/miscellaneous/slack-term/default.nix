{
  lib,
  config,
  pkgs,
  ...
}:
let
  inherit (lib) mkOption;
  inherit (lib) mkIf;
  inherit (lib) mkMerge;
  inherit (lib) types;
  inherit (types) bool;
  inherit (types) attrs;

  default = import ./settings.default.nix { inherit config; };

  program = "slack-term";
  category = "miscellaneous";
  type = "cli";
in
{
  options.${type}.${category}.${program} = {
    enable = mkOption {
      description = "Whether to enable ${program}'s default config.";
      default = config.${type}.${category}.enable;
      type = bool;
    };

    settings = mkOption {
      description = "Settings for ${program}, written as JSON.";
      inherit default;
      type = attrs;
    };
  };

  config.xdg.configFile = mkIf config.${type}.${category}.${program}.enable {
    "${program}/config".text = builtins.toJSON (mkMerge [
      default
      config.${type}.${category}.${program}.settings
    ]);
  };

  config.programs.bash = mkIf config.${type}.${category}.${program}.enable {
    initExtra = ''
      ${program}() (
        set -e

        local CONFIG
        local TOKEN_FILE
        local TOKEN

        if [ -n "$XDG_CONFIG_HOME" ]; then
          CONFIG="$XDG_CONFIG_HOME/${program}/config"
          TOKEN_FILE="$XDG_CONFIG_HOME/${program}/token"
        else
          CONFIG="$HOME/.config/${program}/config"
          TOKEN_FILE="$HOME/.config/${program}/token"
        fi

        if [ -f "$TOKEN_FILE" ]; then
          TOKEN=$(<"$TOKEN_FILE")
        else
          TOKEN=""
        fi

        local args=()
        local has_token=false
        local has_config=false
        local has_debug=false

        for arg in "$@"; do
          [[ "$arg" == "-token" ]] && has_token=true
          [[ "$arg" == "-config" ]] && has_config=true
          [[ "$arg" == "-debug" ]] && has_debug=true
          args+=("$arg")
        done

        if ! $has_config; then
          args+=("-config" "$CONFIG")
        fi

        if ! $has_token; then
          if $has_debug; then
            echo "$(date +"%Y/%m/%d %H:%M:%S") no token provided, using one from disk"
          fi
          args+=("-token" "$TOKEN")
        fi

        ${pkgs.${program}}/bin/${program} "''${args[@]}"

      )
    '';
  };

  config.programs.zsh = mkIf config.${type}.${category}.${program}.enable {
    initExtra = ''
      ${program}() (
        set -e

        local CONFIG
        local TOKEN_FILE
        local TOKEN

        if [[ -n $XDG_CONFIG_HOME ]]; then
          CONFIG="$XDG_CONFIG_HOME/${program}/config"
          TOKEN_FILE="$XDG_CONFIG_HOME/${program}/token"
        else
          CONFIG="$HOME/.config/${program}/config"
          TOKEN_FILE="$HOME/.config/${program}/token"
        fi

        if [ -f "$TOKEN_FILE" ]; then
          TOKEN=$(<"$TOKEN_FILE")
        else
          TOKEN=""
        fi

        local args=()
        local has_token=false
        local has_config=false
        local has_debug=false

        for arg in "$@"; do
          [[ "$arg" == "-token" ]] && has_token=true
          [[ "$arg" == "-config" ]] && has_config=true
          [[ "$arg" == "-debug" ]] && has_debug=true
          args+=("$arg")
        done

        if ! $has_config; then
          args+=("-config" "$CONFIG")
        fi

        if ! $has_token; then
          if $has_debug; then
            echo "$(date +"%Y/%m/%d %H:%M:%S") no token provided, using one from disk"
          fi
          args+=("-token" "$TOKEN")
        fi

        ${pkgs.${program}}/bin/${program} "''${args[@]}"
        return "$?
      )
    '';
  };

  config.programs.fish = mkIf config.${type}.${category}.${program}.enable {
    interactiveShellInit = ''
      function ${program}

        set -l CONFIG
        set -l TOKEN_FILE
        set -l TOKEN

        if test -n "$XDG_CONFIG_HOME"
          set CONFIG "$XDG_CONFIG_HOME/${program}/config"
          set TOKEN_FILE "$XDG_CONFIG_HOME/${program}/token"
        else
          set CONFIG "$HOME/.config/${program}/config"
          set TOKEN_FILE "$HOME/.config/${program}/token"
        end

        if test -f "$TOKEN_FILE"
          set TOKEN (cat "$TOKEN_FILE")
        else
          set TOKEN ""
        end

        set -l args
        set -l has_token false
        set -l has_config false
        set -l has_debug false

        for arg in $argv
          switch $arg
            case -token
              set has_token true
            case -config
              set has_config true
            case -debug
              set has_debug true
          end
          set args $args $arg
        end

        if test $has_config = false
          set args $args -config $CONFIG
        end

        if test $has_token = false
          if test $has_debug = true
            echo (date "+%Y/%m/%d %H:%M:%S") "no token provided, using one from disk"
          end
          if test -n "$TOKEN"
              set args $args -token $TOKEN
          end
        end

        ${pkgs.${program}}/bin/${program} $args
        return $status
      end
    '';
  };

  config.home.shellAliases = mkIf config.${type}.${category}.${program}.enable rec {
    "slack" = program;
  };
}
