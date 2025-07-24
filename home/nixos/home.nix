{ config, lib, pkgs, ... }:

{
  home.username = lib.mkDefault "dbochoa77";
  home.homeDirectory = lib.mkDefault "/home/${config.home.username}";

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
    gimp
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

  home.file = {
  };

  home.sessionVariables = {
    EDITOR = "nvim";
  };

  programs.home-manager.enable = true;
}
