{
  inputs, 
  ...
}:

{
home.file.".config/nvim" = { 
    source = "${inputs.nvimDotfiles}/nvim";
    recursive = true;
  };

home.file.".config/dwm" = { 
    source = "${inputs.dwmDotfiles}/dwmRepo";
    recursive = true;
  };
}
