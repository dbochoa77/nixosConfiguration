{ pkgs }: with pkgs; [
    gcc
    gnumake
    git 
    python3
    python3Packages.pip
    xclip 
    ninja
    gdb
    cmake
    pkg-config

    #CAC
    ccid
    nssTools
    opensc
    pcsc-tools
    pcsclite
]


