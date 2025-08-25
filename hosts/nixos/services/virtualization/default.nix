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
        swtpm.enable = true;                   # expose TPM to libvirt
      };
    };

    spiceUSBRedirection.enable = true;
    swtpm.enable = true;                       # run the software TPM
  };

  security.tpm2.enable = true;                 # host TPM (optional, safe)
}

