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

    bash
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

  hardware.enableAllFirmware = true;
  services.fwupd.enable = true;

  documentation.enable = true;
  documentation.dev.enable = true;
  documentation.doc.enable = false;
  documentation.info.enable = false;
  documentation.man.enable = false;

  boot = {
    # See console messages during early boot.
    initrd.kernelModules = [ "fbcon" ];

    plymouth.enable = true;

    # Disable console blanking after being idle.
    kernelParams = [ "consoleblank=0" ];

    # Clean /tmp on boot
    cleanTmpDir = true;

    # Increase the amount of inotify watchers
    # Note that inotify watches consume 1kB on 64-bit machines.
    kernel.sysctl = {
      "fs.inotify.max_user_watches"   = 1048576;   # default:  8192
      "fs.inotify.max_user_instances" =    1024;   # default:   128
      "fs.inotify.max_queued_events"  =   32768;   # default: 16384
    };
  };

  # /etc/hosts
  networking.extraHosts = secrets.extraHosts;

  # Google nameservers
  networking.nameservers = [
    "8.8.8.8"
    "8.8.4.4"
  ];

  # Select internationalisation properties.
  i18n = {
    consoleFont = "Lat2-Terminus16";
    consoleKeyMap = "us";
    defaultLocale = "en_US.UTF-8";
  };

  # Set the timezone.
  time.timeZone = "America/Denver";

  # automatic updates every day
  system.autoUpgrade.enable = true;

  # automatic gc
  nix.gc.automatic = true;
  nix.gc.dates = "weekly";
  nix.gc.options = "--delete-older-than 30d";

  # Enable passwd and co.
  users.mutableUsers = true;

  # Disable displaying the NixOS manual in a virtual console.
  services.nixosManual.showManual = false;

  # Disable the infamous systemd screen/tmux killer
  services.logind.extraConfig = ''
    KillUserProcesses=no
  '';

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
