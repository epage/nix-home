{ config, pkgs, ... }:

{
  services.redshift = {
    enable = true;
    temperature.night = 4000;
    brightness.night = "0.8";
  };
  location.provider = "geoclue2";
}
