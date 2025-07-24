###############################################

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

  boot.initrd.luks.devices."luks-device".device = "/dev/disk/by-uui/YOUR-UUID-HERE";
 
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

  # Enable networking
  networking.networkmanager.enable = true;

####################
# Services Xserver #
####################
  services.xserver.enable = true;

#######
# DWM #
#######
  #services.xserver.windowManager.dwm.enable = true;
  services.xserver.displayManager.startx.enable = true;
  services.xserver.windowManager.dwm.enable = true;

services.xserver.windowManager.dwm.package = pkgs.dwm.overrideAttrs (old: {
	src = /dwm;
});



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

  users.users.USERNAME = {
    isNormalUser = true;
    description = "USERNAME";
    extraGroups = [ "networkmanager" "wheel" ];
    packages = with pkgs; [];
  };

  # Enable automatic login for the user.
  services.getty.autologinUser = "USERNAME";

############################
# Priopitory Packages True #
############################

  nixpkgs.config.allowUnfree = true;

#######################
### System Packages ###
#######################

 environment.systemPackages = with pkgs; [

#############################
###  Desktop Environment  ###
#############################

  # Audio
  libva
  mesa
  vdpauinfo
  vlc
  pipewire
  pavucontrol # GUI volume control
  alsa-utils  # For `alsamixer`, `speaker-test`, etc
  dwm

  # Bluetooth
  bluez
  bluez-tools
  blueman

  # Browser
  brave
  librewolf
  firefox

  # X11
  xorg.xinit
  xorg.xsetroot
  xterm
  xorg.xrandr
  xorg.libXrandr
  xorg.libX11
  xorg.libXext
  xorg.setxkbmap

  # Rice
  dmenu
  #nerdfonts
  #font-awesome
  feh
  slock
  adwaita-qt
  papirus-icon-theme
  bibata-cursors
  jetbrains-mono

  # School
  discord
  obsidian
  gimp 
 libreoffice 
  signal-desktop

  # Cac Card Tools
  pcsclite 
  pcsc-tools
  opensc
  ccid 
  nssTools  

  # Terminal
  alacritty
  picom

  # Utlities
  p7zip
  curl
  htop
  slock
  unzip
  rtkit
  fastfetch
  timeshift
  pkg-config
  flameshot
  mpv
  rsync
  sutils
  exfatprogs
  yt-dlp
  zip
  zsh
  wget
  pkgs.mupdf 
  zstd
  brightnessctl
  dosfstools
  ntfs3g
  util-linux
  udisks
    freetype
fontconfig
freetype
    fontconfig
pkgs.xorg.xinit

  # X11
  xorg.xinit
  xorg.xsetroot
  xterm
  xorg.xrandr
  xorg.libXrandr
  xorg.libX11
  xorg.libXext
    xorg.libXft
    xorg.libXinerama


  # 3D Printing Tools
  prusa-slicer
  openscad
  blender
  freecad

#######################
# AUDIO TOOLS CHATGPT #
#######################

  ffmpeg
  gst_all_1.gstreamer
  gst_all_1.gst-plugins-base
  gst_all_1.gst-plugins-good
  gst_all_1.gst-plugins-bad
  gst_all_1.gst-plugins-ugly
  gst_all_1.gst-libav

#######################
### Developer Tools ###
#######################

  # General Tools
  git
  nano
  vim
  neovim
  xclip

  # Low Level Language
  gdb # Debugger
#  make
  cmake
  ninja
  
  # Aseembly
  nasm
  yasm
 
  glibc
  binutils
  pkg-config
  gcc_multi
  glibc_multi  

  # C/C++
  gcc
  gnumake

  # Python
  python3
  python3Packages.pip
  python3Packages.virtualenv
  python311Packages.ipython

  # Packages
  python3Packages.numpy
  python3Packages.scipy
  python3Packages.matplotlib
  python3Packages.requests
  python3Packages.flask

###########################
### Cybersecuirty Tools ###
###########################

  # Cybersecurity Tools
  nmap
  whois
  dnsutils
  traceroute

  # Pentesting
  nikto
  sqlmap
  hydra
  john

  # Packet Analysis
  wireshark-cli
  tcpdump

  # Forensics
  binwalk
  foremost
 # volatility3

  # Exploitation
  radare2
  ghidra-bin

  # Wireless & Bluetooth
  aircrack-ng

  # Web & Scripting
  burpsuite
 # zaproxy

  # Misc
  hashcat
  netcat-openbsd
  socat
  openssl
  wireshark
  metasploit

  ### Virtual Machines
  pkgs.qemu
  virt-manager       # GUI for managing VMs
  libvirt            # Core virtualization daemon
  virt-viewer        # For viewing VMs
  spice-gtk          # SPICE support (optional but useful)
  dnsmasq            # Network bridging
  bridge-utils       # For bridged networking
  OVMF

################################
# Electrical Engineering Toool #
################################
  
  # Schematics
  kicad            # Schematic + PCB editor
  
  # Extras 
  kicadAddons.kikit
  kicadAddons.kikit-library
  
  # Other   
  fritzing         # Visual breadboard view
  librepcb         # Lightweight alternative to KiCad
  ngspice          # Circuit simulation
  xschem           # Simple schematic tool
  gnuplot          # Graph simulation results
  inkscape         # For diagram annotation/export
  imagemagick      # Convert/export images (PDF/PNG)
  
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

  users.groups.libvirtd.members = ["USERNAME"];

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
  

################
# Card Readers #
################
  boot.kernelModules = [ "usb_storage" "sd_mod" "mmc_block" ];


}
