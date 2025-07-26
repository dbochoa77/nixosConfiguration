let 
  nixos = "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIFVvzboBnpnTrMhqGtPEq1TW+fnU3LQDh0nLh+DrSCMp";
in {
  "secret1.age".publicKeys = [ nixos ];
}
