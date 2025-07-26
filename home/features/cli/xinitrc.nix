{ config, pkgs, ... }:

{
  xsession.enable = true;
  xsession.windowManager.command = ''
    #!/bin/sh
   picom --config ~/.config/picom.conf &
   exec ~/.config/dwm/dwm 
    '';
}

#feh --no-fehbg --bg-scale /home/dbochoa77/personal/Wallpapers/hannibalCrossingTheAlps.jpg &
    

