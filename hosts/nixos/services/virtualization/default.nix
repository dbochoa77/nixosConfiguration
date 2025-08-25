{ config, pkgs, ... }:

{
  programs.virt-manager.enable = true;

  users.users.dbochoa77.extraGroups = [ "libvirtd" "kvm" ];

  virtualisation = {
    libvirtd = {
      enable = true;
      qemu = {
        # (optional) make sure we’re on the KVM build
        package = pkgs.qemu_kvm;
        ovmf.enable = true;
        ovmf.packages = [ pkgs.OVMFFull.fd ];  # has VARS/SecureBoot
      };
    };

    spiceUSBRedirection.enable = true;
  };

  environment.systemPackages = [ pkgs.swtpm pkgs.virt-viewer pkgs.spice-gtk pkgs.spice-vdagent ];

  security.tpm2.enable = true;                 # host TPM (optional, safe)
}

