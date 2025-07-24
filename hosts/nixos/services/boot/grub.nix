{ config, pkgs, ... }:

{
  boot.loader = {
       grub.enable = true;
       grub.device = "/dev/vda";
       grub.useOSProber = true;
    };
}
