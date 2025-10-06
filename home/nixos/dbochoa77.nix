{ config, ... }: 

{ 
  imports = [ 
    ../dbochoa77/default.nix
    ../features/default.nix
    ./home.nix
    ./default.nix
  ]; 
}

