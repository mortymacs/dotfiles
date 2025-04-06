{ pkgs, ... }:
{
  programs.alacritty = {
    enable = true;
    package = pkgs.unstable.alacritty;
  };

  home.packages = with pkgs; [
    ptyxis
  ];

  xdg.configFile = {
    "alacritty/alacritty.toml".source = ./alacritty.toml;
  };
}
