{ 
   config, 
   pkgs, 
   inputs,
   ...
}: { 
  users.users.${user} = {
    isNormalUser = true;
    description = "username";
    extraGroups = [ "media" "networkmanager" "wheel" "docker" ];
 
    packages = [inputs.home-manager.packages.${pkgs.system}.default];
  };
  home-manager.users.${user} =
    import ../../../home/${user}/${config.networking.hostName}.nix;
 }
