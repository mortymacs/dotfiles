{pkgs, ...}:
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

  home.packages = with pkgs; [ unstable.neovide ];
}
