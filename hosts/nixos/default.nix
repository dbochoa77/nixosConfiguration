{ config, inputs, outputs, lib, pkgs, ... }:

{
 imports = [
   ./hardware-configuration.nix
   ./services
   ../dbochoa77
   ./configuration.nix
   inputs.home-manager.nixosModules.home-manager
  ];


  home-manager = {
   useUserPackages = true;
   extraSpecialArgs = { inherit inputs outputs; };
   users.dbochoa77 = 
   import ../../home/nixos/dbochoa77.nix;   
   }; 
}
