{ config, lib, pkgs, ... }:

{
  home.username = lib.mkDefault "dbochoa77";
  home.homeDirectory = lib.mkDefault "/home/${config.home.username}";

  home.stateVersion = "24.05";

  home.packages = import ../../pkgs/userPackages { inherit pkgs; };
 
  home.sessionVariables = {
    EDITOR = "nvim";
  };

  #home.sessionPath = [
  #    "$HOME/.emacs.d/bin:$PATH"
  #];  

  programs.home-manager.enable = true;
}
