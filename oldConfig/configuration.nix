###################
#Config & Packages#
###################

{ config, pkgs, ... }:

{
  imports =
    [ # Include the results of the hardware scan.
      ./hardware-configuration.nix
    ];


##############
# Bootloader #
##############
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;

#####################
# Use latest kernel #
#####################
  boot.kernelPackages = pkgs.linuxPackages_latest;

##############
# Encryption #
##############
  boot.initrd.luks.devices."luks-6f5a683b-a714-46fb-88b5-db4d59342ef4".device = "/dev/disk/by-uuid/6f5a683b-a714-46fb-88b5-db4d59342ef4";
 
########################
# Networking Host Name # 
########################
  networking.hostName = "nixos"; # Define your hostname.
  # Configure network proxy if necessary
  # networking.proxy.default = "http://user:password@proxy:port/";
  # networking.proxy.noProxy = "127.0.0.1,localhost,internal.domain";

##########
# Flakes #
##########
  nix.settings.experimental-features = [ "nix-command" "flakes" ];

#####################
# Enable networking #
#####################
  networking.networkmanager.enable = true;

####################
# Services Xserver #
####################
  services.xserver.enable = true;

##########
# Startx #
##########
  services.xserver.displayManager.startx.enable = true;

############
# Timezone #
############
  time.timeZone = "America/Los_Angeles";

###########################################
# Select internationalisation properties. #
###########################################
  i18n.defaultLocale = "en_US.UTF-8";
  i18n.extraLocaleSettings = {
    LC_ADDRESS = "en_US.UTF-8";
    LC_IDENTIFICATION = "en_US.UTF-8";
    LC_MEASUREMENT = "en_US.UTF-8";
    LC_MONETARY = "en_US.UTF-8";
    LC_NAME = "en_US.UTF-8";
    LC_NUMERIC = "en_US.UTF-8";
    LC_PAPER = "en_US.UTF-8";
    LC_TELEPHONE = "en_US.UTF-8";
    LC_TIME = "en_US.UTF-8";
  };

###########################
# Configure keymap in X11 #
###########################
    services.xserver.xkb = {
    layout = "us";
    variant = "";
  };


################
# User Account #
################
  users.users.dbochoa77 = {
    isNormalUser = true;
    description = "dbochoa77";
    extraGroups = [ "networkmanager" "wheel" ];
    packages = with pkgs; [
  # Browsers
  brave
  firefox
  librewolf

  # Audio Tools (GUI / User)
  pavucontrol
  vlc

  # Rice / WM tools
  dmenu
  feh
  picom
  slock

  # Terminal & Shell
  alacritty
  zsh
  fastfetch

  # School / Work
  discord
  obsidian
 # gimp
  libreoffice
  signal-desktop
  thunderbird
  libnotify

  # Multimedia
  flameshot
  ffmpeg
  mpv
  pdfarranger
  mupdf
  yt-dlp

  # Utilities
  nano
  neovim
  vim
  sutils

  # Developer Tools
  git
  xclip

  # C/C++ & Assembly Dev (user-specific)
  nasm
  yasm

  # Python (user-specific tools)
  python311Packages.ipython
  python3Packages.pip
  python3Packages.virtualenv

  # Node (user-specific)
  nodePackages.npm

  # 3D Printing / CAD
  prusa-slicer
  blender
  freecad

  # Electrical Engineering
 # kicad
 # kicadAddons.kikit
 # kicadAddons.kikit-library
];
 
  };

  # Enable automatic login for the user.
  services.getty.autologinUser = "dbochoa77";

############################
# Priopitory Packages True #
############################
  nixpkgs.config.allowUnfree = true;

#######################
### System Packages ###
#######################
 fonts.packages = with pkgs; [
    nerd-fonts.fira-code
    nerd-fonts.hack
    nerd-fonts.jetbrains-mono
  ];

###############################
# Environment System Packages #
###############################
 environment.systemPackages = with pkgs; [
  
  # System Utilities
  curl
  wget
  rsync
  unzip
  zip
  zstd
  p7zip
  ntfs3g
  dosfstools
  exfatprogs
  util-linux
  brightnessctl
  htop
  rtkit
  timeshift
  udisks

  # Development Tools (basic system-wide)
  git
  gcc
  gnumake
  cmake
  gdb
  ninja
  pkg-config
  xclip

  # Python base
  python3

  # Node base
  nodejs
  nodePackages.npm

  # Assembly toolchain
  nasm
  yasm
  gcc_multi
  glibc
  glibc_multi

  # Virtualization
  OVMF
  bridge-utils
  dnsmasq
  libvirt
  qemu
  spice-gtk
  virt-manager
  virt-viewer

  # CAC tools (require system-level access)
  ccid
  nssTools
  opensc
  pcsc-tools
  pcsclite

  # Audio system-wide components
  alsa-utils
  pipewire
  mesa
  libva
  vdpauinfo

  # Fonts + graphics stack
  fontconfig
  freetype

  # X11 Core (shared display stack)
  xorg.xinit
  xorg.xrandr
  xorg.setxkbmap
  xorg.xsetroot
  xorg.libXext
  xorg.libXft
  xorg.libXinerama
  xorg.libXrandr
  xterm

  ];

##################################
#### --- Services Enabled  --- ###
##################################

#############################
# Enable the OpenSSH daemon #
#############################   

  services.openssh.enable = true;

#############
# Bluetooth #
#############

  services.pipewire.wireplumber.extraConfig."10-bluez" = {
      "monitor.bluez.properties" = {
        "bluez5.enable-sbc-xq" = true;
        "bluez5.enable-msbc" = true;
        "bluez5.enable-hw-volume" = true;
        "bluez5.roles" = [
          "hsp_hs"
          "hsp_ag"
          "hfp_hf"
          "hfp_ag"
          ];
       };
    };

  hardware.bluetooth = {
    enable = true;
    powerOnBoot = true;
  };
  services.blueman.enable = true;

#####################
### --- Sound --- ###
#####################

  boot.extraModprobeConfig = ''
    options snd slots=snd-hda-intel
  '';

#######
# CAC #
#######
  services.pcscd.enable = true; 

############
# Pipewire #
############

  security.rtkit.enable = true;
  services.pipewire = {
    enable = true; # if not already enabled
    alsa.enable = true;
    alsa.support32Bit = true;
    pulse.enable = true;
    jack.enable = true;
  };

  services.pulseaudio.enable = false;

##########################
# Nix Package Management #
##########################

####################
# Virtual Machines #
####################

  programs.virt-manager.enable = true;

  users.groups.libvirtd.members = ["dbochoa77"];

  virtualisation.libvirtd.enable = true;

  virtualisation.spiceUSBRedirection.enable = true;

########################
# System State Version #
########################

  system.stateVersion = "25.05"; # Did you read the comment? YES

#######################
# Intel Video Drivers #
#######################

  services.xserver.videoDrivers = [ "modesetting" ];
  hardware.graphics.enable = true;

  hardware.graphics.extraPackages = with pkgs; [
	  intel-media-driver
		  vaapiIntel
		  vaapiVdpau
  ];

####################
# Systemd Services # 
####################

############
# Plymouth #
############
  boot = {
    plymouth = {
      enable = true;
      theme = "spinner"; # Use a safe built-in theme first to confirm it works
    };

    kernelParams = [
      "quiet"
      "splash"
    ];

    consoleLogLevel = 3;
    initrd.verbose = false;

    loader = {
      timeout = 0;
    };
  };


# Wireguard
#networking.wireguard.interfaces = {
#  wg0 = {
#    ips = [ "10.100.0.2/24" ];
#    privateKeyFile = "/etc/wireguard/client_privatekey";
#
#    peers = [
#      {
#        publicKey = "X5R1sP4R7zerty7CLNTlqVBd/5bKjAMxiuoChRflwBg=";
#        endpoint = "SERVER_PUBLIC_IP_OR_DOMAIN:51820";
#        allowedIPs = [ "0.0.0.0/0" ];  # Route all traffic through VPN
#        persistentKeepalive = 25;
#      }
#    ];
#  };
#};

################
# Card Readers #
################

  boot.kernelModules = [ "usb_storage" "sd_mod" "mmc_block" ];


}
