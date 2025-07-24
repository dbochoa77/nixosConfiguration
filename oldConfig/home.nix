{ config, pkgs, ... }:

{
  home.username = "dbochoa77";
  home.homeDirectory = "/home/dbochoa77";

  home.stateVersion = "24.05";

  
  home.packages = with pkgs; [

     #############################
    ### Browsers & GUI Tools ###
    #############################
    brave
    librewolf
    firefox
    vlc
    mpv
   # gimp
    obsidian
    discord
    signal-desktop
    thunderbird
    libreoffice
    pdfarranger
    flameshot
    timeshift

    #######################
    ### Terminal Tools ###
    #######################
   
    git
    curl
    htop
    unzip
    zip
    wget
    fastfetch
    xclip

    ##########################
    ### 3D Printing / CAD ###
    ##########################
    prusa-slicer
    openscad
    blender
    freecad
    kicad
    kicadAddons.kikit
    kicadAddons.kikit-library
    fritzing
    librepcb
    ngspice
    xschem
    gnuplot
    inkscape
    imagemagick

    ###########################
    ### Cybersecurity Tools ###
    ###########################
    nmap
    whois
    dnsutils
    traceroute
    sqlmap
    hydra
    john
    binwalk
    foremost
    radare2
    metasploit
    burpsuite
    aircrack-ng
    hashcat
    netcat-openbsd
    socat
    openssl

    #######################
    ### Python + SciPy ###
    #######################
    (python3.withPackages (ps: with ps; [
      requests
      numpy
      scipy
      matplotlib
      flask
  ]))
];

programs.zsh.enable = true;

programs.git = {
    enable = true;
    userName = "dbochoa77";
    userEmail = "dbochoa77@proton.me";
};

programs.neovim = {
    enable = true;
    defaultEditor = true;
  };
}
