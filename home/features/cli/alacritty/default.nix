programs.alacritty = {
  enable = true;

  settings = {
    font = {
      normal = {
        family = "JetBrainsMono Nerd Font";
      };
      size = 16; # default zoom level
    };

    key_bindings = [
      { key = "Equals"; mods = "Control"; action = "IncreaseFontSize"; }
      { key = "Minus";  mods = "Control"; action = "DecreaseFontSize"; }
      { key = "Key0";   mods = "Control"; action = "ResetFontSize"; }
    ];
  };
};
