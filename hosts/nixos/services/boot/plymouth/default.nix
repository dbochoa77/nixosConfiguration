{ config, pkgs, ... }:

{
  boot = {
    plymouth = {
      enable = true;
      theme = "spinner"; # Use a safe built-in theme first to confirm it works
    };

    kernelParams = [
      "quiet"
      "splash"
    ];

    consoleLogLevel = 3;
    initrd.verbose = false;

    loader = {
      timeout = 5;
    };
  };
}
