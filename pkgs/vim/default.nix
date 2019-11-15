{ config, pkgs, ... }:

{

  nixpkgs.config.vim = {
    ftNixSupport = true;
  };

}
