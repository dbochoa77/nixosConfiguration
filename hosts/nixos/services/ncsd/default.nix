{ lib, config, pkgs, ... }:

{
  # in your NixOS config
  services.nscd.enable = true;
  system.nssModules = lib.mkForce []; 
  services.nscd.package = pkgs.glibc;          # use classic glibc nscd (not nsncd)
}
