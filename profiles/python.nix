{ pkgs, ... }:

{
  home.packages = with pkgs; [
    python
    python27Packages.virtualenv
    python3
    python37Packages.black
    #python37Packages.poetry Broken?
    python37Packages.flake8
    mypy
  ];
}
