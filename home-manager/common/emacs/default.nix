{ pkgs, ... }: {
  programs.emacs = {
    enable = true;
    package = pkgs.unstable.emacs-nox;
  };

  xdg.configFile.emacs = {
    source = ./elisp;
    recursive = true;
  };
}
