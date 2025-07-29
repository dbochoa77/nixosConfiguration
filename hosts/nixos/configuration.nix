{ config, pkgs, lib, ... }:

{

  environment.systemPackages = import ../../nixos/pkgs/systemPackages {inherit pkgs; };

  # Encryption   
  services.encryption.enable = true; 

}
