{ config, pkgs, ... }:

{

  imports = [
    ../pkgs/bash/default.nix
    ../pkgs/git/default.nix
    ../pkgs/ssh/default.nix
    ../pkgs/vim/default.nix
    ../pkgs/neovim/default.nix
  ];

  home.packages = with pkgs; [
    bat  # cat
    bb  # system monitor
    fd  # find
    ripgrep  # grep
    exa  # ls
    dust  # du
    tokei  # loc

    hyperfine
    git
    xsv
    jq
    hexyl
    universal-ctags
    #haskellPackages.mdcat Broken?

    nix-du
    nix-index

    screen
    curl
    dos2unix
    file
    gnumake
    nmap
    p7zip
    pmutils
    strace
    tcpdump
    unzip
    usbutils
    python3Packages.xkcdpass
    vim_configurable
    wget
    youtube-dl
    zip
  ];

  # Allow proprietary software (such as the NVIDIA drivers).
  nixpkgs.config.allowUnfree = true;

  programs.home-manager.enable = true;

  home.sessionVariables.LESS = "-R";

  programs.direnv.enable = true;
  programs.skim.enable = true;
  programs.broot.enable = true;

  home.file.".screenrc".text = ''
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
