{ pkgs, ... }:
{
  programs.emacs = {
    enable = true;
    package = pkgs.emacs-nox;
  };

  services.emacs = {
    enable = true;
    package = pkgs.emacs-nox;
  };
}
