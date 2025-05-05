{
  inputs',
  pkgs,
  ...
}:let docgen = pkgs.callPackage ../docgen.nix {inherit(inputs') vimcats;};in{
  devenv.shells.default = {
    git-hooks = {
      hooks = {
        markdownlint.enable = true;
        luacheck.enable = true;
        editorconfig-checker.enable = true;
        docgen = {
          enable = true;
          name = "docgen";
          entry = "${docgen}/bin/docgen";
          files = "\\.(lua)$";
          pass_filenames = false;
        };
        doctags = {
          enable = true;
          name = "doctags";
          entry = "${pkgs.neovim-unwrapped}/bin/nvim -c 'helptags doc' +q";
          files = "\\.(txt)$";
          pass_filenames = false;
        };
      };
    };
    cachix = {
      pull = [
        "pre-commit-hooks"
      ];
    };
    packages = with pkgs; [nixd statix];
  };
}
