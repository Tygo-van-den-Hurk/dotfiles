pkgs: with pkgs; writeShellScriptBin "hibernate" (builtins.readFile ./script.sh)
