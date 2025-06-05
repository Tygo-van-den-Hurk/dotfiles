{
  disabled = true;
  format = "using [$name]($style) \\([$symbol]($style)\\) on [$version]($style)";
  version_format = "v\${raw}";
  style = "149 bold";
  symbol = "C++";

  detect_files = [ ];
  detect_folders = [ ];
  detect_extensions = [
    "cpp"
    "cc"
    "cxx"
    "c++"
    "hpp"
    "hh"
    "hxx"
    "h++"
    "tcc"
  ];

  commands = [
    [
      "c++"
      "--version"
    ]
    [
      "g++"
      "--version"
    ]
    [
      "clang++"
      "--version"
    ]
  ];
}
