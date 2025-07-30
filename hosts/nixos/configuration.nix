{ config, pkgs, lib, ... }:

{

  environment.systemPackages = import ../../pkgs/systemPackages {inherit pkgs; };

}
