{
  treefmt = {
    flakeCheck = true;
    flakeFormatter = true;
    programs = {
      statix.enable = true;
      alejandra.enable = true;
      stylua.enable = true;
    };
  };
}
