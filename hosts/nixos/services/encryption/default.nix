{ config, pkgs, ... }:

{
  
  boot.initrd.luks.devices."luks".device = "/dev/disk/by-uuid/UUID";

}

