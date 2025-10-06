{ config, ... }: 

{ 
  imports = [ 
    ../dbochoa77
    ../features/default.nix
    ./home.nix
    ./default.nix
  ]; 
}

