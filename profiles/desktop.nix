{ pkgs, ... }:

let
  unstable = import <unstable> {};
in {

  home.packages = with pkgs; [
    imagemagick

    xterm
    alacritty
    xdg_utils

    gparted

    epdfview
    firefox
    xfontsel
    slack
    zoom-us
    vimHugeX
    libreoffice
    vlc
    meld

    neovim-qt
    
    unstable.chromium
    unstable.chrome

    google-play-music-desktop-player
  ];

  programs.autorandr.enable = true;
}
