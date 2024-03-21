{ pkgs, ... }: {
  programs.wezterm = {
      enable = true;
      package = pkgs.unstable.wezterm;
      extraConfig = builtins.readFile ./wezterm.lua;
  };
}
