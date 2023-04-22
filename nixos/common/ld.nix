# Source: https://github.com/atkrad/dotfiles/
{ inputs, pkgs, ... }:
{
  programs.nix-ld.enable = true;

  nixpkgs.overlays = [
    inputs.nix-alien.overlays.default
  ];
  imports = [
    # Optional, but this is needed for `nix-alien-ld` command
    inputs.nix-ld.nixosModules.nix-ld
  ];
  environment.systemPackages = with pkgs; [
    nix-alien
    nix-index # not necessary, but recommended
    nix-index-update
  ];
}
