{ config, pkgs, ... }:

{
  nix.settings = {
    experimental-features = [ "nix-command" "flakes" ];
    trusted-users = [ "root" "dbochoa77"];
  };

  home-manager.backupFileExtension = "backup";

}

