{ pkgs, ... }:
{
  imports = [ ../base ];

  home.packages = with pkgs; [ unstable.discord ];
}
