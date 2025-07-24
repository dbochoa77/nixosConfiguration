#!/bin/bash
set -e

cp /etc/nixos/hardware-configuration.nix /home/dbochoa77/nixos/hosts/nixos/hardware-configuration.nix

cd /home/dbochoa77/nixosConfiguration

nix-shell -p git --run "
sudo nixos-rebuild switch --flake .#nixos
home-manager switch --flake .#nixos
"

# Add script to source files
source .bashrc

