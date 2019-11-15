{ config, pkgs, ... }:

{
  home.packages = with pkgs; [
    audacity
    obs-studio
    pitivi
    kdeApplications.kdenlive
  ];
}
