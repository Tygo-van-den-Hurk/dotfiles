{
  pyenv_version_name = false;
  pyenv_prefix = "virtual env";
  python_binary = [
    [ "python" ]
    [ "python3" ]
    [ "python2" ]
  ];

  format = "using [\${symbol} \${version}]($style)";

  version_format = "v\${raw}";

  style = "yellow bold";

  symbol = "Python";

  disabled = false;

  detect_extensions = [
    "py"
    "ipynb"
  ];

  detect_files = [
    "requirements.txt"
    ".python-version"
    "pyproject.toml"
    "Pipfile"
    "tox.ini"
    "setup.py"
    "__init__.py"
  ];

  detect_folders = [ ];
  detect_env_vars = [ "VIRTUAL_ENV" ];
}
