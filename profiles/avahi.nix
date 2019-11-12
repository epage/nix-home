{ config, pkgs, ... }:

{
  services.avahi.enable = true;  # Network printer discovery
  services.avahi.publish.enable = true;
  services.avahi.publish.userServices = true;
  services.avahi.nssmdns = true;
}
