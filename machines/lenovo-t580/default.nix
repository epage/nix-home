{
  imports = [
    ../nixos-hardware/lenovo/thinkpad
    ../nixos-hardware/common/cpu/intel
    ../nixos-hardware/common/pc/laptop/ssd
  ];

  services.fprintd.enable = true;
}
