{ pkgs, inputs, ... }:
{
  # Neovim.
  programs.neovim = {
    enable = true;
    withRuby = false;
    withPython3 = false;
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

  # Zed.
  programs.zed-editor = {
    enable = true;
    package = inputs.zed-editor.packages.${pkgs.stdenv.hostPlatform.system}.default;
  };
}
