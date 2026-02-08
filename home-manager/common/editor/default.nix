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

  # Emacs.
  programs.emacs = {
    enable = true;
    package = pkgs.unstable.emacs-nox;
  };
  services.emacs = {
    enable = true;
    package = pkgs.unstable.emacs-nox;
    startWithUserSession = true;
  };
  xdg.configFile.emacs = {
    source = ./elisp;
    recursive = true;
  };

  # IPython.
  xdg.configFile.ipython = {
    source = ./ipython;
    recursive = true;
  };
}
