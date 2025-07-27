{
  description = "Configuration for Nixos Server";

 inputs = {
    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
    nixpkgs-stable.url = "github:nixos/nixpkgs/nixos-24.05";

    agenix.url = "github:ryantm/agenix";
    
    nvimDotfiles = {
    url = "git+https://github.com/dbochoa77/nvim.git";
    flake = false;
    };
  
    dwmDotfiles = { 
    url = "git+https://github.com/dbochoa77/dwmRepo.git";
    flake = false;
    };
  };

  outputs = { 
	self, 
	agenix,
	dwmDotfiles,
	nvimDotfiles,
	home-manager,
	nixpkgs,
	...
    } @ inputs: let
      inherit (self) outputs;
      systems = [
        "x86_64-linux"
      ];
      forAllSystems = nixpkgs.lib.genAttrs systems;  

    in {
    #packages =
    #  forAllSystems (system: import ./pkgs { pkgs = nixpkgs.legacyPackages.${system}; }
    #);

    overlays = import ./overlays {inherit inputs;};

    nixosConfigurations = {
        nixos = nixpkgs.lib.nixosSystem {
	  specialArgs = {inherit inputs outputs;};
	  modules = [./hosts/nixos/default.nix
		     ./hosts/nixos/hardware-configuration.nix
		     agenix.nixosModules.default
	  ];
	};
      };

      #./hosts/nixos/configuration.nix was removed, working on fixing podman

      homeConfigurations = { 
        "nixos" = home-manager.lib.homeManagerConfiguration {
	  pkgs = nixpkgs.legacyPackages."x86_64-linux";
	  extraSpecialArgs = {inherit inputs outputs;};
	  modules = [./home/nixos/dbochoa77.nix];
	};
      };
    };
} 
