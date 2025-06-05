pkgs:
with pkgs;
let
  script = builtins.readFile ./script.sh;
  dependencies = ''
    # Makes sure that the dependencies are installed and preferred.

    function basename() {
      ${coreutils}/bin/basename "$@"
      return $?
    }

    function cat() {
      ${coreutils}/bin/cat "$@"
      return $?
    }

    function mktemp() {
      ${coreutils}/bin/mktemp "$@"
      return $?
    }

  '';
in
writeShellScriptBin "backuper" ''
  ${dependencies}
  ${script}
''
