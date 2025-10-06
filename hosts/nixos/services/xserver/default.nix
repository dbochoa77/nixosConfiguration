{ config, pkgs, ... }:

{
  services.xserver.displayManager.startx.enable = true;
  services.xserver.enable = true;
  services.xserver.videoDrivers = [ "modesetting" ];
}

