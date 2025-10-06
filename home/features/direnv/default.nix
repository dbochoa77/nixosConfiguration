{ config, lib, ... }:

{
  programs.direnv = {
    enable = true;
    nix-direnv.enable = true;   # recommended, integrates nix flakes nicely
  };
}
