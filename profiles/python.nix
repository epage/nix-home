{ pkgs, ... }:

{
  environment.systemPackages = with pkgs; [

    python3
    python37Packages.black
    python37Packages.poetry
    python37Packages.flake8
    mypy

  ];
}
