{ config, pkgs, ... }:

{
  services.xserver.enable = true;

  xsession.enable = true;
  xsession.windowManager.command = ''
    #!/bin/sh
    exec ~/.config/dwm/dwm &
    feh --no-fehbg --bg-scale /home/dbochoa77/personal/Wallpapers/hannibalCrossingTheAlps.jpg &
    picom --config ~/.config/picom.conf
  '';
}

