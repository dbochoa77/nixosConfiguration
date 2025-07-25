{ pkgs }: 

( import ./developerTools { inherit pkgs; })
++
( import ./nixos-tools { inherit pkgs; })
++
( import ./security { inherit pkgs; })
++
( import ./virtualzation { inherit pkgs; })

