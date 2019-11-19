{ pkgs, ... }:

{

  home.packages = with pkgs; [
    imagemagick

    xterm
    alacritty
    xdg_utils

    gparted

    epdfview
    chromium
    firefox
    xfontsel
    slack
    zoom-us
    vimHugeX
    libreoffice
    vlc
    meld

    neovim-qt

    google-play-music-desktop-player
  ];

  programs.autorandr.enable = true;
}
