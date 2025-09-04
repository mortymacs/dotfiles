{ pkgs, ... }:
{
  # Neovim.
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

  # IPython.
  xdg.configFile.ipython = {
    source = ./ipython;
    recursive = true;
  };
}
