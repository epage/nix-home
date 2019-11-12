{ config, lib, pkgs, ... }:
with lib;

let secrets = import ../secrets.nix;
in
{
  # Define a user account. Don't forget to set a password with ‘passwd’.
  users.extraUsers.epage = {
    description = "Ed Page";
    isNormalUser = true;

    extraGroups = [
      "audio"
      "libvirtd"
      "networkmanager"
      "users"
      "vboxusers"
      "docker"
      "video"
      "wheel"
    ];

    initialPassword = "epage";
  };
}
