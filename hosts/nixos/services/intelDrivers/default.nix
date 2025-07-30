{ config, pkgs, ... }

{
services.xserver.videoDrivers = [ "modesetting" ];
   hardware.graphics.enable = true;
 
   hardware.graphics.extraPackages = with pkgs; [
       intel-media-driver
           vaapiIntel
           vaapiVdpau
   ];
} 
