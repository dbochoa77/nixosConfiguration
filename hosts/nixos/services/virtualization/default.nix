{ config, pkgs, ... }:
 
{ 
  programs.virt-manager.enable = true;
  virtualisation = { 
  libvirtd.enable = true;
  libvirtd.networks.default.enable = true;
  spiceUSBRedirection.enable = true;
};

  users.users.dbochoa77.extraGroups = [ "libvirtd" "kvm" "tty" "video" "audio"];

    environment.systemPackages = with pkgs; [
      qemu_kvm
    ];
}

