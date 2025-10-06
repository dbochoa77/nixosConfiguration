{ pkgs }: with pkgs; [
  signal-desktop
  libnotify
  { nixpkgs.config.allowUnfreePredicate = pkg: builtins.elem (lib.getName pkg) [
             "discord"
           ];
         }
]
