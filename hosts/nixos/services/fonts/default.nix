{ pkgs, config, ... }:

{
    fonts.fonts = with pkgs; [
    nerd-fonts.fira-code
    nerd-fonts.ubuntu
    nerd-fonts.hack
  ];
}
