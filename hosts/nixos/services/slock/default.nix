{ config, pkgs, ... }:

{
   security.wrappers.slock = {
    # Path to your custom-compiled binary (adjust if different)
    source = "/home/dbochoa77/.config/slock/slock";
    owner = "root";
    group = "root";
    setuid = true;   # gives it root privilege to disable OOM killer
    setgid = false;
  };

  security.pam.services.slock.text = ''
    auth     include login
    account  include login
    password include login
    session  include login
  '';
}
