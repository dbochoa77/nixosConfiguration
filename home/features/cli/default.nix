{pkgs, ...}: {
    imports = [
    ./alias/default.nix
    ./fastfetch/default.nix
    ./bash_profile/default.nix
    #./xinitrc/default.nix
    ./picom/default.nix
    ./direnv/default.nix
    ./eza/default.nix
    ./bat/default.nix
    ];

  home.packages = with pkgs; [
    coreutils 
    fd
    htop
    httpie
    jq
    procs
    ripgrep
    tldr
    zip 
  ];
}
