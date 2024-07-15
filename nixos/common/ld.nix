# Source: https://github.com/atkrad/dotfiles/
{ pkgs, ... }:
{
  programs.nix-ld.enable = true;
  environment.systemPackages = with pkgs; [
    stdenv.cc.cc.lib
    nix-index
  ];
}
