{ pkgs, ... }:
{
  programs.alacritty = {
    enable = true;
    package = pkgs.unstable.alacritty;
  };

  xdg.configFile = {
    "alacritty/alacritty.toml".source = ./alacritty.toml;
  };

  programs.wezterm = {
    enable = true;
    # package = pkgs.unstable.wezterm;
    extraConfig = builtins.readFile ./wezterm.lua;
  };
}
