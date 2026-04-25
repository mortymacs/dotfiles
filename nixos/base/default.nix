{ inputs, ... }:
{
  imports = [
    ../common/configuration.nix
    ../common/network.nix
    ../common/ld.nix
    ../common/fwupd.nix
    ../common/font.nix
    ../common/misc.nix
    ../common/excludes.nix
    ../common/desktop.nix
    ../common/virtualisation.nix
    ../common/packages.nix
  ];

  nixpkgs = {
    hostPlatform = "x86_64-linux";
    config.allowUnfree = true;
    overlays = import ../../overlays inputs;
  };
}
