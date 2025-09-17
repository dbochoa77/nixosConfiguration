{ config, pkgs, ... }:

{
  nixos-boot = {
    enable  = true;

    # Pick one: "load_unload" (growing/shrinking Nix logo) or "evil-nixos" (spinning logo)
    theme = "load_unload";

    # Optional: background color (0–255 each)
    bgColor = { red = 0; green = 0; blue = 0; };   # black

    # Optional: force the splash to linger N seconds (helps on super-fast boots)
    duration = 3.0;

    # Different colors
    # bgColor.red   = 100; # 0 - 255
    # bgColor.green = 100; # 0 - 255
    # bgColor.blue  = 100; # 0 - 255

    # If you want to make sure the theme is seen when your computer starts too fast
    # duration = 3; # in seconds
  };
}
