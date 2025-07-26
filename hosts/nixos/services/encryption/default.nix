{ config, pkgs, lib, ... }:

{
  options.services.encryption.enable = lib.mkOption {
    type = lib.types.bool;
    default = false;
    description = "Enable LUKS encryption settings for initrd.";
  };

  config = lib.mkIf config.services.encryption.enable {
    boot.initrd.luks.devices."luks".device = "/dev/disk/by-uuid/UUID";
  };
}
