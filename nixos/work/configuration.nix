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
    config = {
      allowUnfree = true;
      allowUnfreePredicate = pkg: true;
    };
    overlays = [
      (final: prev: {
        unstable = import inputs.nixpkgs-unstable {
          inherit (final) system;
          config = {
            allowUnfree = true;
            allowUnfreePredicate = pkg: true;
          };
        };
      })
    ];
  };

  # Global packages.
  environment.systemPackages = with pkgs; defaultPackages.list ++ [ ];

  # Security.
  services.cato-client = {
    enable = true;
    package = pkgs.unstable.cato-client;
  };

  # NixOS installed version.
  system.stateVersion = "25.11";
}
