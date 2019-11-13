{ config, pkgs, ... }:

{
  programs.ssh = {
    enable = true;
    compression = true;
    controlMaster = "auto";
    controlPersist = "10m";
  };
}
