{ pkgs, ... }:
{
  imports = [ ../base ];

  _module.args.hasCuda = true;

  home.packages = with pkgs; [ unstable.discord ];
}
