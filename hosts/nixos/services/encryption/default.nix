{ config, pkgs, lib, ... }:

{      
  boot.initrd.luks.devices."luks-6f5a683b-a714-46fb-88b5-db4d59342ef4".device = "/dev/disk/by-uuid/6f5a683b-a714-46fb-88b5-db4d59342ef4";
}
