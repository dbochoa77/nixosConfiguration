{pkgs, ...}: {
    imports = [
    ./firefox/default.nix
    ./librewolf/default.nix
    ./emacs/default.nix
    ];

}
