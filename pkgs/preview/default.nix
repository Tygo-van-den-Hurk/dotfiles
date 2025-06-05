pkgs:
with pkgs;
let
  script = builtins.readFile ./script.sh;
  dependencies = ''
    # Makes sure that the dependencies are installed and preferred.

    function chafa() {
      ${chafa}/bin/chafa "$@"
      return $?
    }

    function bat() {
      ${bat}/bin/bat "$@"
      return $?
    }

    function eza() {
      ${eza}/bin/eza "$@"
      return $?
    }

    function basename() {
      ${toybox}/bin/basename "$@"
      return $?
    }

    function file() {
      ${file}/bin/file "$@"
      return $?
    }

    function pdftoppm() {
      ${poppler-utils}/bin/pdftoppm "$@"
      return $?
    }

    function grep() {
      ${toybox}/bin/grep "$@"
      return $?
    }

    function rm() {
      ${toybox}/bin/rm "$@"
      return $?
    }

    function echo() {
      ${toybox}/bin/echo "$@"
      return $?
    }

  '';
in
writeShellScriptBin "preview" ''
  ${dependencies}
  ${script}
''
