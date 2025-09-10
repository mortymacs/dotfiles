{ pkgs, ... }:
{
  programs.foot = {
    enable = true;
    package = pkgs.unstable.foot;
  };

  xdg.configFile = {
    "foot/foot.ini".source = ./foot.ini;
  };
}
