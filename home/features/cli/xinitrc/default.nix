{ config, pkgs, ... }:

{
  xsession.enable = true;
  xsession.windowManager.command = ''
    #!/bin/sh
    picom --config ~/.config/picom/picom.conf &

    exec ~/.config/slstatus/slstatus &
    exec ~/.config/dwm/dwm 
    '';
}

    

