pkgs:
with pkgs;

let

  program =
    let

      script = builtins.readFile ./script.bash;

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
    writeShellScriptBin "preview-script" ''
      ${dependencies}
      ${script}
    '';
in

stdenv.mkDerivation rec {
  name = "preview";
  src = ./.;

  inherit program;

  buildPhase = ''
    runHook preBuild
    # ...
    runHook postBuild
  '';

  installPhase = ''
    runHook preInstall

    mkdir --parents $out/bin
    cp $program/bin/preview-script $out/bin/preview

    mkdir --parents $out/share/bash-completion/completions
    cp $src/completions.bash $out/share/bash-completion/completions/preview.bash

    # mkdir --parents $out/share/fish/vendor_completions.d/
    # cp $src/completions.fish $out/share/fish/vendor_completions.d/preview.fish

    # mkdir --parents $out/share/zsh/site-functions/
    # cp $src/completions.zsh $out/share/zsh/site-functions/preview

    runHook postInstall
  '';
}
