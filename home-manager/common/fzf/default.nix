{ pkgs, ... }:
{
  programs = {
    fzf = {
      enable = true;
      enableFishIntegration = true;
      tmux = {
        enableShellIntegration = true;
      };
      package = pkgs.unstable.fzf;
    };
    skim = {
      enable = true;
    };
  };
}
