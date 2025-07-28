{ config, ... }: { 
  imports = [ 
    ../dbochoa77
    ../features/cli
    #    ../features/gui
    ./home.nix
    ./dotfiles
  ]; 

  features = {
    cli = {
    fastfetch.enable = true;
    };
  };
}

