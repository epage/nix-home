{ config, lib, pkgs, ... }:

{
  home.packages = with pkgs; [
    etherape
    ettercap
    tcpdump
    wireshark
  ];
}
