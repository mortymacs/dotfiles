{ pkgs, ... }:
{
  programs.kitty = {
    enable = true;
    package = pkgs.unstable.kitty;
    extraConfig = builtins.readFile ./kitty.conf;
  };
}
