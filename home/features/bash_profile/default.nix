 { config, lib, pkgs, ... }:

{
  programs.bash.initExtra = ''
    if [[ -z $DISPLAY && $(tty) == /dev/tty1 ]]; then
       exec startx
    fi
  '';
}



