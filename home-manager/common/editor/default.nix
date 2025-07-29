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

  # Zed.
  programs.zed-editor = {
    enable = true;
    package = pkgs.unstable.zed-editor;
  };

  # IPython.
  xdg.configFile.ipython = {
    source = ./ipython;
    recursive = true;
  };
}
