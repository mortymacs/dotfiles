{ pkgs, ... }: {
  programs.alacritty = {
    enable = true;
    package = pkgs.unstable.alacritty;
  };

  programs.wezterm = {
      enable = true;
      package = pkgs.unstable.wezterm;
      extraConfig = builtins.readFile ./wezterm.lua;
  };

  xdg.configFile = { "alacritty/alacritty.toml".source = ./alacritty.toml; };
}
