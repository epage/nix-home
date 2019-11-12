{ pkgs, ... }:

{

  services.xserver = {
    enable = true;
    enableCtrlAltBackspace = true;

    displayManager.lightdm.enable = true;
    desktopManager.default = "xfce";
    desktopManager.xfce.enable = true;
    desktopManager.xterm.enable = false;

    xautolock.enable = true;
  };

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

  fonts = {
    enableFontDir = true;
    enableGhostscriptFonts = true;
    fonts = with pkgs; [
      corefonts
      dejavu_fonts
      emojione
      fira-code
      font-awesome-ttf
      inconsolata
      proggyfonts
      powerline-fonts
      source-code-pro
      source-sans-pro
      source-serif-pro
      terminus_font
      ubuntu_font_family
      vistafonts
    ];
  };

  environment.systemPackages = with pkgs; [
    xorg.xrdb
    xorg.setxkbmap
    xorg.iceauth # required for KDE applications (it's called by dcopserver)
    xorg.xlsclients
    xorg.xset
    xorg.xsetroot
    xorg.xinput
    xorg.xprop
    xorg.xauth
    xorg.xmodmap
    xorg.xbacklight
    numlockx
    xautolock
    xss-lock
    xtitle
    xclip

    xfce.thunar_volman
    xfce.xfce4_systemload_plugin
    xfce.xfce4_cpufreq_plugin
    xfce.xfce4_cpugraph_plugin
    xfce.xfce4_power_manager
    xfce.xfce4taskmanager

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

    google-play-music-desktop-player
    messenger-for-desktop
  ];


  # Enable corsair keyboard/mouse
  hardware.ckb.enable = true;

  # Enable 3D acceleration for 32bit applications (e.g. wine)
  hardware.opengl.driSupport32Bit = true;
  hardware.opengl.driSupport = true;
  hardware.opengl.enable = true;

  # Allow ChromeCast to send/receive packets
  # http://askubuntu.com/a/326224/177448
  networking.firewall.extraCommands = ''
    iptables -I INPUT -p udp -m udp --dport 32768:60999 -j ACCEPT
  '';

  # Hide Mouse When Idle Daemon
  services.unclutter.enable = true;

  programs.ssh.forwardX11 = true;
}
