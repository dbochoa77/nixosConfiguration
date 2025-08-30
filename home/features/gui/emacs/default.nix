{ config, lib, pkgs, inputs, ... }:

{
  xdg.enable = true;

  programs.emacs = {
    enable = true;
    package = pkgs.emacs29; # or emacs29-pgtk
    extraPackages = epkgs: [
      epkgs.pdf-tools   # brings pdf-tools + epdfinfo
    ];
  };

  # (If you're linking Doom via inputs)
  home.file.".config/emacs".source = inputs.emacsDotfiles;

  # Make Doom’s bin discoverable
  home.sessionPath = [
    "${config.xdg.configHome}/emacs/bin"
  ];

  #If you also want ~/.local/bin on PATH (handy for other tools):
  home.sessionPath = [
    "${config.home.homeDirectory}/.local/bin"
    "${config.xdg.configHome}/emacs/bin"
  ];
}

