# Edit this configuration file to define what should be installed on
# your system.  Help is available in the configuration.nix(5) man page
# and in the NixOS manual (accessible by running ‘nixos-help’).

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

  # Configure network proxy if necessary
  # networking.proxy.default = "http://user:password@proxy:port/";
  # networking.proxy.noProxy = "127.0.0.1,localhost,internal.domain";

  # Enable networking
  networking.networkmanager.enable = true;


  services.xserver.enable = true;
  services.xserver.displayManager.startx.enable = true;
/*  services.xserver.windowManager.dwm.enable = true; REMOVED SINCE CUSTOM DWM */

/*  services.getty."tty1".autoLogin = {
    enable = true;
    user = "isNormalUser";
    };

*/

  # Set your time zone.
  time.timeZone = "America/Los_Angeles";

  # Select internationalisation properties.
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

  # Configure keymap in X11
  services.xserver.xkb = {
    layout = "us";
    variant = "";
  };

  # Define a user account. Don't forget to set a password with ‘passwd’.
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


  # Terminal
  alacritty


  # 3D Printing Tools
  prusa-slicer
  openscad
  freecad
  blender

  #################
  # Delovper Tools#
  #################

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

  # Bluetooth
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

/*ChatGPT Generated*/
/*services.xserver.displayManager.lightdm = {
  enable = true;
  greeters.gtk.enable = true;
  greeters.gtk.extraConfig = ''
    background = /etc/nixos/wallpapers/matrix.png
    theme-name = Adwaita-dark
    font-name = JetBrains Mono 11
    position = 50%,center 50%,center
  '';
};
*/

}
