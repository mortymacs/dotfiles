{
  pkgs,
  inputs,
  ...
}:
let
  defaultPackages = import ../common/packages.nix { inherit pkgs; };
in
{
  imports = [
    ./hardware-configuration.nix
    ../common/configuration.nix
    ../common/network.nix
    ../common/ld.nix
    ../common/fwupd.nix
    ../common/font.nix
    ../common/misc.nix
    ../common/excludes.nix
    ../common/desktop.nix
    ../common/virtualisation.nix
  ];

  # Config packages.
  nixpkgs = {
    overlays = [
      (final: prev: {
        unstable = import inputs.nixpkgs-unstable { system = final.stdenv.hostPlatform.system; };
      })
    ];
  };

  # Global packages.
  environment.systemPackages = with pkgs; defaultPackages.list ++ [ ];

  # NixOS installed version.
  system.stateVersion = "25.11";
}
