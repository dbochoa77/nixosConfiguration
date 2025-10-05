{ config, pkgs, ... }:

{
  services.system76-scheduler.enable = true;
  #services.system76-power.enable = true;

  environment.systemPackages = [
    pkgs.system76-scheduler
  ];
}
