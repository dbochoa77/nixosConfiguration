{ pkgs, config, ... }:

{
    fonts.packages = with pkgs; [
        noto-fonts
        noto-fonts-cjk-sans
        noto-fonts-emoji
        liberation_ttf
        fira-code
        fira-code-symbols
        mplus-outline-fonts.githubRelease
        dina-font
        proggyfonts
  ];

    fonts.packages = with pkgs; [ 
        nerdfonts 
  ];
}
