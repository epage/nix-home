{ config, pkgs, ... }:

{
  imports =
    [
      ./lenovo-t580

      ../users/epage.nix

      ../profiles/default.nix

      ../profiles/audio.nix
      ../profiles/avahi.nix
      ../profiles/bluetooth.nix
      ../profiles/desktop.nix
      ../profiles/printing.nix
      ../profiles/powermanagement.nix
      ../profiles/redshift.nix
      ../profiles/security.nix
      #../profiles/games.nix

      ../profiles/networking.nix
      ../profiles/docker.nix
      #../profiles/latex.nix
      ../profiles/rust.nix
      ../profiles/python.nix
    ];

  networking.hostName = "ati";
  networking.networkmanager.enable = true;

  # The global useDHCP flag is deprecated, therefore explicitly set to false here.
  # Per-interface  useDHCP will be mandatory in the future, so this generated config
  # replicates the default behavior.
  networking.useDHCP = false;
  networking.interfaces.enp0s31f6.useDHCP = true;
  networking.interfaces.wlp4s0.useDHCP = true;

  # Use the systemd-boot EFI boot loader.
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;

  powerManagement.powertop.enable = true;
  powerManagement.upower.enable = true;
  networking.networkmanager.wifi.powersave = true;

  boot.kernelParams = [
    # Enable guc/huc firmware loading for intel gpu
    "i915.enable_guc=3"
    "i915.enable_psr=1"
  ];
  # HW video accel
  hardware.opengl.extraPackages = with pkgs; [
    vaapiIntel
    libvdpau-va-gl
    intel-media-driver
    vulkan-loader
  ];

  # Too much back-and-forth with a Mac
  services.xserver.libinput.naturalScrolling = true;
  services.xserver.libinput.disableWhileTyping = true;

  services.smartd.enable = true;
}

