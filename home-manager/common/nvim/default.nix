{ pkgs, ... }:
{
  programs.neovim = {
    enable = true;
    vimAlias = true;
    viAlias = true;
    defaultEditor = true;
    package = pkgs.unstable.neovim-unwrapped;
  };

  xdg.configFile.nvim = {
    source = ./lua;
    recursive = true;
  };

  programs.helix = {
    enable = true;
    package = pkgs.unstable.helix;
    settings = {
      theme = "ayu_dark";
      editor = {
        mouse = false;
      };
    };
  };
}
