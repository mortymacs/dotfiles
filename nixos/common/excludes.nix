{ pkgs, ... }:
{
  services.xserver.excludePackages = with pkgs; [
    xterm
  ];
}
