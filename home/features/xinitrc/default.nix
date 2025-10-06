{ config, pkgs, ... }:

{
  xsession.enable = true;
  xsession.windowManager.command = ''
    #!/bin/sh
    picom --config ~/.config/picom/picom.conf &

     feh --no-fehbg --bg-scale /home/dbochoa77/personal/Wallpapers/hannibalCrossingTheAlps.jpg &

    exec ~/.config/slstatus/slstatus &
    exec ~/.config/dwm/dwm 
    '';
}

    

