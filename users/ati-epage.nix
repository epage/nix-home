{ config, pkgs, ... }:

{
  imports =
    [
      ../profiles/default.nix

      ../profiles/desktop.nix
      #../profiles/games.nix

      ../profiles/networking.nix
      ../profiles/rust.nix
      ../profiles/python.nix
    ];

  programs.git.userEmail = "epage@duosecurity.com";
}

