#!/usr/bin/env bash

set -e

# Variables
XINITRC="$HOME/.xinitrc"

echo "[*] Rebuilding NixOS system..."
sudo nixos-rebuild switch --flake .#nixos

echo "[*] Updating Home Manager configuration..."
home-manager switch --flake .#nixos

echo "[*] Creating .xinitrc..."
cat > "$XINITRC" <<EOF
#!/bin/sh

# Compositor
picom --config ~/.config/picom.conf &

# Launch DWM
exec ~/.config/dwm/dwm
EOF

chmod +x "$XINITRC"

echo "[*] .xinitrc created successfully."
echo "[*] Done! You can start your DWM session with 'startx'."

