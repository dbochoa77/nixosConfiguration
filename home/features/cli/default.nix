{pkgs, ...}: {
    imports = [
    ./alias.nix
    ./fastfetch.nix
    ./bash_profile.nix
    ./xinitrc.nix
    ./picom.nix
    ];


  programs.eza = {
    enable = true;
    enableFishIntegration = true;
    enableBashIntegration = true;
    extraOptions = ["-l" "--icons" "--git" "-a"];
  };

  programs.bat = {enable = true;};



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
