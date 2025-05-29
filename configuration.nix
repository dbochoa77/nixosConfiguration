###############################################
### --- Diego Ochoa NixOS Configuration --- ###
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

  # Bootloader.
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;

  boot.initrd.luks.devices."luks-UUID-HERE".device = "/dev/disk/by-uuid/UUID-HERE";
  networking.hostName = "nixos"; # Define your hostname.
  # networking.wireless.enable = true;  # Enables wireless support via wpa_supplicant.

    [
      ./hardware-configuration.nix
    ];

##############
# Bootloader #
##############

  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;

  boot.initrd.luks.devices."luks-5f8ec843-3be5-4997-b9c4-7203d3c3b575".device = "/dev/disk/by-uuid/5f8ec843-3be5-4997-b9c4-7203d3c3b575";

########################
# Networking Host Name # 
########################
 
  networking.hostName = "nixos"; 
  # networking.wireless.enable = true;  # Enables wireless support via wpa_supplicant.

##########
# Flakes #
##########

  nix.settings.experimental-features = [ "nix-command" "flakes" ];

  # Configure network proxy if necessary
  # networking.proxy.default = "http://user:password@proxy:port/";
  # networking.proxy.noProxy = "127.0.0.1,localhost,internal.domain";

  # Enable networking
  networking.networkmanager.enable = true;


  services.xserver.enable = true;
  services.xserver.displayManager.startx.enable = true;
  services.xserver.windowManager.dwm.enable = true; REMOVED IF CUSTOM DWM 


  # Set your time zone.
  time.timeZone = "America/Los_Angeles";

  # Select internationalisation properties.

#####################
# Enable networking #
#####################

  networking.networkmanager.enable = true;

####################
# Services Xserver #
####################

  services.xserver.enable = true;
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
    packages = with pkgs; [];
  };

  # Allow unfree packages
  nixpkgs.config.allowUnfree = true;


#{  services.xserver.enable = true;

#services.xserver.displayManager.startx.enable = true;

 # services.xserver.windowManager.dwm.enable = false;

  # List packages installed in system profile. To search, run:
  # $ nix search wget
  environment.systemPackages = with pkgs; [


  # Audio
  mesa
  libva
  vdpauinfo
  vlc

  # School
  obsidian

  # General Desktop Tools
  htop
  btop
  curl
  unzip
  rtkit
  zip
  fastfetch
  timeshift
  zsh
  pkg-config
  flameshot
  yt-dlp
  mpv
  rsync
  discord

#########################
# Allow unfree packages #
#########################

  nixpkgs.config.allowUnfree = true;


  # List packages installed in system profile. To search, run:
  # $ nix search wget
 
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

  # Bluetooth
  bluez
  bluez-tools
  blueman

  # Browser
  firefox
  brave

  # X11
  xorg.xinit
  xorg.xsetroot
  xterm
  xorg.xrandr
  xorg.libXrandr
  xorg.libX11
  xorg.libXext

  # Rice
  dmenu
  nerdfonts
  font-awesome
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

  # Terminal
  alacritty

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

  # X11
  xorg.xinit
  xorg.xsetroot
  xterm
  xorg.xrandr
  xorg.libXrandr
  xorg.libX11
  xorg.libXext

  # 3D Printing Tools
  prusa-slicer
  openscad
  freecad
  blender

  #################
  # Delovper Tools#
  #################

#######################
### Developer Tools ###
#######################

  # General Tools
  git
  nano
  vim
  neovim

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


  # Do not forget to add an editor to edit configuration.nix! The Nano editor is also installed by default.
  #  wget
  ];

  # Some programs need SUID wrappers, can be configured further or are
  # started in user sessions.
  # programs.mtr.enable = true;
  # programs.gnupg.agent = {
  #   enable = true;
  #   enableSSHSupport = true;
  # };

  # List services that you want to enable:

  # Virtualization

systemd.tmpfiles.rules = [ "L+ /var/lib/qemu/firmware - - - - ${pkgs.qemu}/share/qemu/firmware" ];

  # Pipewire
  security.rtkit.enable = true;
  services.pipewire = {
    enable = true; # if not already enabled
    alsa.enable = true;
    alsa.support32Bit = true;
    pulse.enable = true;
    # If you want to use JACK applications, uncomment this
    #jack.enable = true;
  };

#sound.enable = true;
#hardware.pipewire.enable = true;

##################################
#### --- Services Enabled  --- ###
##################################

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

############
# Pipewire #
############

  security.rtkit.enable = true;
  services.pipewire = {
    enable = true; # if not already enabled
    alsa.enable = true;
    alsa.support32Bit = true;
    pulse.enable = true;
    # If you want to use JACK applications, uncomment this
    #jack.enable = true;
  };

####################
# Virtual Machines #
####################

programs.virt-manager.enable = true;

users.groups.libvirtd.members = ["dbochoa77"];

virtualisation.libvirtd.enable = true;

virtualisation.spiceUSBRedirection.enable = true;

  # Open ports in the firewall.
  # networking.firewall.allowedTCPPorts = [ ... ];
  # networking.firewall.allowedUDPPorts = [ ... ];
  # Or disable the firewall altogether.
  # networking.firewall.enable = false;

  # This value determines the NixOS release from which the default
  # settings for stateful data, like file locations and database versions
  # on your system were taken. It‘s perfectly fine and recommended to leave
  # this value at the release version of the first install of this system.
  # Before changing this value read the documentation for this option
  # (e.g. man configuration.nix or on https://nixos.org/nixos/options.html).
  system.stateVersion = "24.11"; # Did you read the comment?

#######################
# Intel Video Drivers #
#######################

services.xserver.videoDrivers = [ "modesetting" ];

}
