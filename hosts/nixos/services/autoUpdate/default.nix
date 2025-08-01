{ config, pkgs, ... }:

{
  system.autoUpgrade = {
    enable = true;

    # Point to your flake (use a string ref). Include the host attr if you want.
    flake = "/home/admin/Homelab/nixosBase#nixos";

    # nixos-rebuild flags:
    flags = [
      "-L"                           # show logs
      "--update-input" "nixpkgs"     # update nixpkgs only (or use --recreate-lock-file)
      "--commit-lock-file"           # commit updated flake.lock (requires the repo to be a git repo)
    ];

    operation = "switch";            # default
    dates = "02:00";                 # daily at 02:00
    randomizedDelaySec = "45min";    # spread updates
    persistent = true;               # run after boot if missed
    allowReboot = true;              # reboot automatically if needed (kernel, etc.)
  };
}

