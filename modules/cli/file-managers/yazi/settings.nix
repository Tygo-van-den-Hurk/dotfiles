{
  lib,
  config,
  ...
}:
let
  inherit (lib) mkIf;
  inherit (lib) mkDefault;

  program = "yazi";
  category = "file-managers";
  type = "cli";
in
{
  config.programs.${program}.settings = mkIf config.${type}.${category}.${program}.enable {

    # Sorting files
    mgr = {
      sort_by = mkDefault "alphabetical";
      sort_dir_first = mkDefault true;
      sort_sensitive = mkDefault false;
      sort_reverse = mkDefault false;
      sort_translit = mkDefault true;
    };

    # What to Show
    mgr = {
      show_hidden = mkDefault true;
      show_symlink = mkDefault true;
    };

    # How the preview is supposed to look
    preview = {
      wrap = mkDefault "no";
      tab_size = mkDefault 2;
    };

  };
}
