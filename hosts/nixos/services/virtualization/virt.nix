{ config, pkgs, ... }:
 
{ 
  programs.virt-manager.enable = true;
  virtualisation = { 
  libvirtd.enable = true;
  spiceUSBRedirection.enable = true;
};

  users.users.dbochoa77.extraGroups = [ "libvirtd" "kvm" ];

    environment.systemPackages = with pkgs; [
      qemu_kvm
    ];
}

