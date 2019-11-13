{ config, pkgs, ... }:

{

  imports = [
    ../pkgs/bash/config.nix
    ../pkgs/steam/config.nix
    ../pkgs/vim/config.nix
  ];

  # List packages installed in system profile. To search by name, run:
  # nix-env -qaP | grep wget
  environment.systemPackages = with pkgs; [
    bat  # cat
    bb  # system monitor
    fd  # find
    ripgrep  # grep
    exa  # ls
    dust  # du

    skim  # Fuzzy finder
    hyperfine
    git
    xsv
    jq
    hexyl
    universal-ctags
    mdcat

    curl
    dos2unix
    file
    gnumake
    htop
    iftop
    iotop
    lsof
    mkpasswd
    nix-prefetch-scripts
    nix-repl
    nmap
    p7zip
    pciutils
    pmutils
    psmisc
    stdenv
    strace
    sudo
    sysstat
    tcpdump
    unzip
    usbutils
    vim_configurable
    wget
    youtube-dl
    zip
  ];

  # Allow proprietary software (such as the NVIDIA drivers).
  nixpkgs.config.allowUnfree = true;

  documentation.enable = true;
  documentation.dev.enable = true;
  documentation.doc.enable = false;
  documentation.info.enable = false;
  documentation.man.enable = false;

  # Select internationalisation properties.
  i18n = {
    consoleFont = "Lat2-Terminus16";
    consoleKeyMap = "us";
    defaultLocale = "en_US.UTF-8";
  };

  # Set the timezone.
  time.timeZone = "America/Denver";

  # automatic gc
  nix.gc.automatic = true;
  nix.gc.dates = "weekly";
  nix.gc.options = "--delete-older-than 30d";

  programs.command-not-found.enable = true;

  programs.less.enable = true;

  programs.screen.screenrc ''
    autodetach on # Autodetach session on hangup instead of terminating screen completely

    # tab-completion flash in heading bar
    vbell off

    # Make vim behave like in a normal shell
    altscreen on

    # Turn off the splash screen
    startup_message off

    # Use a 30000-line scrollback buffer
    defscrollback 30000

    # Act as if each screen is a fresh login (ie load the right bash files)
    shell -$SHELL

    hardstatus alwayslastline
    hardstatus string '%{= kG}[ %{G}%H %{g}][ %{=kw}%?%-Lw%?%{r}(%{W}%n*%f%t%?(%u)%?%{r})%{w}%?%+Lw%?%?%= %{g}][%{B}%Y-%m-%d %{W}%c %{g}]'
  '';
}
