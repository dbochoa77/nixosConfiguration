{ config, pkgs, lib, ... }:

{

  environment.systemPackages = import ../../pkgs/systemPackages {inherit pkgs; };

  # Encryption   
  services.encryption.enable = true; 

}
