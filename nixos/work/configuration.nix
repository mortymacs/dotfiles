{ pkgs, ... }:
{
  imports = [
    ./hardware-configuration.nix
    ../base
  ];

  networking.hostName = "work";

  # VPN client.
  services.cato-client = {
    enable = true;
    package = pkgs.unstable.cato-client;
  };

  system.stateVersion = "25.11";
}
