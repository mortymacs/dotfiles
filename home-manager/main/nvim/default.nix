{pkgs, ...}:
{
  programs.neovim = {
  	enable = true;
    vimAlias = true;
    viAlias = true;
	plugins = with pkgs.vimPlugins; [
	];
  };

  xdg.configFile.nvim = {
      source = ./lua;
      recursive = true;
  };
}
