{ config, pkgs, ... }:
 
{ 
  programs.virt-manager.enable = true;
   
  users.groups.libvirtd.members = ["dbochoa77"];
   
  virtualisation.libvirtd.enable = true;
   
  virtualisation.spiceUSBRedirection.enable = true;
}

