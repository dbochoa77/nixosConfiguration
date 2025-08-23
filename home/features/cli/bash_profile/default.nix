 { config, lib, pkgs, ... }:

{
  programs.bash.initExtra = ''
    fastfetch

    if [[ -z $DISPLAY && $(tty) == /dev/tty1 ]]; then
       exec startx
    fi
  '';
}



