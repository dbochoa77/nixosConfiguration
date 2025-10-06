{ config, lib, pkgs, ... }:

{
  programs.home-manager.enable = true;

  home = { 
    username = lib.mkDefault "dbochoa77";
    packages = import ../../pkgs/userPackages { inherit pkgs; };
    homeDirectory = lib.mkDefault "/home/${config.home.username}";
    stateVersion = "24.05";

    sessionVariables = {
      EDITOR = "nvim";
    };
  };
 
  features = {
    cli = {
    fastfetch.enable = true;
    };
  };
}
