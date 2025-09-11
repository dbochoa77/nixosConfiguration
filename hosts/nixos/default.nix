{ config, inputs, outputs, lib, pkgs, ... }:

{
 imports = [
   ./hardware-configuration.nix
    #./secrets.nix
   ./services
   ../dbochoa77
   ../dbochoa77/extraServices
   ./configuration.nix
   inputs.home-manager.nixosModules.home-manager
  ];

  extraServices.podman.enable = true;

  home-manager = {
   useUserPackages = true;
   extraSpecialArgs = { inherit inputs outputs; };
   users.dbochoa77 = 
   import ../../home/nixos/dbochoa77.nix;   
   }; 
}
