{
  imports = [
    ./containers/wireguard.nix
    ./virtualization/virt.nix
    ./bluetooth/bluetooth.nix
    ./ssh/ssh.nix
    ./pipewire/pipewire.nix
    ./xserver/xserver.nix
    ./encryption/encryption.nix
    ./boot/default.nix
  ];
}

