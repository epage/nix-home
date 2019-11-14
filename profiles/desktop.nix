{ pkgs, ... }:

{

  nixpkgs.config = {
    chromium = {
      jre = false;
      enableGoogleTalkPlugin = true;
      enableAdobeFlash = false;
      enablePepperPDF = true;
    };

    firefox = {
      jre = false;
      enableGoogleTalkPlugin = true;
      enableAdobeFlash = false;
      enablePepperPDF = true;
    };
  };

  environment.systemPackages = with pkgs; [
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

    google-play-music-desktop-player
    messenger-for-desktop
  ];

  programs.ssh.forwardX11 = true;
}
