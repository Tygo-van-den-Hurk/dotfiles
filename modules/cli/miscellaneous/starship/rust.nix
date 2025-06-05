{
  disabled = false;
  format = "using [$symbol $version]($style)";
  version_format = "v\${raw}";
  symbol = "Rust ";
  style = "bold red";
  detect_extensions = [ "rs" ];
  detect_files = [ "Cargo.toml" ];
  detect_folders = [ ];
}
