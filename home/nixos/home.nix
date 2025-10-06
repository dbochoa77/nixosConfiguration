{ config, lib, pkgs, ... }:

{
  programs.home-manager.enable = true;

  home.stateVersion = "24.05";
  home.username = lib.mkDefault "dbochoa77";
  home.homeDirectory = lib.mkDefault "/home/${config.home.username}"; 
  home.packages = import ../../pkgs/userPackages { inherit pkgs; };

  home.file = {
  };

  home.sessionVariables = {
    EDITOR = "nvim";
  };
 
  features = {
    cli = {
    fastfetch.enable = true;
    };
  };
}

