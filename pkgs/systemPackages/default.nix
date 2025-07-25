{ pkgs }: 
( import ./developerTools { inherit pkgs; })
++
( import ./nixos-tools { inherit pkgs; })
++
( import ./security { inherit pkgs; })
++
( import ./virtualization { inherit pkgs; })
++
( import ./xorg { inherit pkgs; })

