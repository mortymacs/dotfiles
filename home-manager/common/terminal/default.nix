{ pkgs, ... }:
{
  programs.alacritty = {
    enable = true;
    package = pkgs.unstable.alacritty;
  };

  xdg.configFile = {
    "alacritty/alacritty.toml".source = ./alacritty.toml;
  };
}
