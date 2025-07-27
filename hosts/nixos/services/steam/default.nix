{ config, pkgs, ... }:

{
  hardware.opengl.enable = true;
  hardware.opengl.driSupport32Bit = true;

  environment.systemPackages = with pkgs; [
    steam
  ];
}
