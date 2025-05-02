{ pkgs, ... }:
{
  programs.neovim = {
    enable = true;
    vimAlias = true;
    viAlias = true;
    defaultEditor = true;
    package = pkgs.neovim-unwrapped;
  };

  programs.vscode = {
    enable = true;
    package = pkgs.unstable.vscode;
  };

  xdg.configFile.nvim = {
    source = ./lua;
    recursive = true;
  };
}
