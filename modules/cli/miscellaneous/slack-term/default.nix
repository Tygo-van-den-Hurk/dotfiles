{
  lib,
  config,
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
    initExtra =
      let
        args = "args[@]"; # Needed because nix wont let me escape
      in
      ''
        function ${program}() {
          local CONFIG
          local TOKEN

          if [ -n "$XDG_CONFIG_HOME" ]; then
            CONFIG="$XDG_CONFIG_HOME/${program}/config"
            TOKEN_FILE="$XDG_CONFIG_HOME/${program}/token"
          else
            CONFIG="$HOME/.config/${program}/config"
            TOKEN_FILE="$HOME/.config/${program}/token"
          fi

          TOKEN=$(cat "$TOKEN_FILE")

          local args=()
          local has_token=false
          local has_config=false

          for arg in "$@"; do
            [[ "$arg" == "-token" ]] && has_token=true
            [[ "$arg" == "-config" ]] && has_config=true
            args+=("$arg")
          done

          if ! $has_config; then
            args+=("-config" "$CONFIG")
          fi

          if ! $has_token; then
            args+=("-token" "$TOKEN")
          fi

          command ${program} "${args}"
        }
      '';
  };

  config.programs.zsh = mkIf config.${type}.${category}.${program}.enable {
    initExtra =
      let
        args = "args[@]"; # Needed because nix wont let me escape
      in
      ''
        ${program}() {
          local CONFIG
          local TOKEN

          if [[ -n $XDG_CONFIG_HOME ]]; then
            CONFIG="$XDG_CONFIG_HOME/${program}/config"
            TOKEN_FILE="$XDG_CONFIG_HOME/${program}/token"
          else
            CONFIG="$HOME/.config/${program}/config"
            TOKEN_FILE="$HOME/.config/${program}/token"
          fi

          TOKEN=$(cat "$TOKEN_FILE")

          local args=()
          local has_token=false
          local has_config=false

          for arg in "$@"; do
            [[ "$arg" == "-token" ]] && has_token=true
            [[ "$arg" == "-config" ]] && has_config=true
            args+=("$arg")
          done

          if ! $has_config; then
            args+=("-config" "$CONFIG")
          fi

          if ! $has_token; then
            args+=("-token" "$TOKEN")
          fi

          command ${program} "${args}"
        }
      '';
  };

  config.programs.fish = mkIf config.${type}.${category}.${program}.enable {
    interactiveShellInit = ''
      function ${program}
        if test -n "$XDG_CONFIG_HOME"
          set CONFIG "$XDG_CONFIG_HOME/${program}/config"
          set TOKEN_FILE "$XDG_CONFIG_HOME/${program}/token"
        else
          set CONFIG "$HOME/.config/${program}/config"
          set TOKEN_FILE "$HOME/.config/${program}/token"
        end

        set TOKEN (cat "$TOKEN_FILE")
        set args
        set has_token false
        set has_config false

        for arg in $argv
          if test "$arg" = "-token"
            set has_token true
          else if test "$arg" = "-config"
            set has_config true
          end
          set args $args $arg
        end

        if test $has_config = false
          set args $args "-config" $CONFIG
        end

        if test $has_token = false
          set args $args "-token" $TOKEN
        end

        command ${program} $args
      end
    '';
  };

  config.home.shellAliases = mkIf config.${type}.${category}.${program}.enable rec {
    slack = "slack-term";
  };
}
