{ config, pkgs, ... };

{
  nix.setting = {
    experimental-features = [ "nix-command" "flakes" ];
    trusted-users = [ "root" "dbochoa77"];
  };
}

