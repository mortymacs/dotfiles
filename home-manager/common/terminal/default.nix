{ pkgs, ... }:
{
  programs.alacritty = {
    enable = true;
    package = pkgs.unstable.alacritty;
  };

  xdg.configFile = {
    "alacritty/alacritty.toml".source = ./alacritty.toml;
  };

  home.packages = with pkgs; [
    (writeShellScriptBin "alacritty-fork" (builtins.readFile ./alacritty-fork.sh))
  ];
}
