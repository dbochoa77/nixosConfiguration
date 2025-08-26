{ config, pkgs, ... }:

{
  programs.virt-manager.enable = true;

  users.users.dbochoa77.extraGroups = [ "libvirtd" "kvm" ];

  virtualisation = {
    libvirtd = {
      enable = true;
      qemu = {
        };
    };

    spiceUSBRedirection.enable = true;
  };

}

