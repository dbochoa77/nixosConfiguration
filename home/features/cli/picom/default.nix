{
  services.picom = {
    enable = true;
    backend = "glx";

    settings = {
      blur-method = "kernel";
      blur-strength = 5;
      opacity-rule = [
        "85:class_g = 'Alacritty'"
      ];
    };
  };
}

