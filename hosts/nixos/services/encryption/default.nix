{ config, pkgs, lib, ... }:

{
  options.services.encryption.enable = lib.mkOption {
    type = lib.types.bool;
    default = false;
    description = "Enable LUKS encryption settings for initrd.";
  };

  config = lib.mkIf config.services.encryption.enable {
      boot.initrd.luks.devices."luks-6f5a683b-a714-46fb-88b5-db4d59342ef4".device = "/dev/disk/by-uuid/6f5a683b-a714-46fb-88b5-db4d59342ef4";
  };
}
