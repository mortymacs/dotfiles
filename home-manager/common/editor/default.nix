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

  programs.vscode = {
    enable = true;
    package = pkgs.unstable.vscode;
  };
}
