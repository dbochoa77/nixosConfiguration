{ config, pkgs, ... }:

{
  xsession.windowManager.command = ''
    #!/bin/sh
   picom --config ~/.config/picom.conf &
   exec ~/.config/dwm/dwm 
    '';
}

    

