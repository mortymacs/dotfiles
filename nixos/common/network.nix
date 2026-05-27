# https://github.com/atkrad/nixie/blob/main/nixos/nixie-ci.nix
{ lib, ... }:
{
  networking = {
    useDHCP = lib.mkDefault true;
    nameservers = [
      "1.1.1.1"
      "1.0.0.1"
    ];
    firewall = {
      enable = true;
      allowPing = false;
    };
    networkmanager = {
      enable = true;
      logLevel = "INFO";
      dns = "systemd-resolved";
      wifi = {
        scanRandMacAddress = false;
        powersave = false;
      };
    };
  };

  services.resolved = {
    enable = true;
    settings.Resolve = {
      DNSSEC = "false";
      DNSOverTLS = "opportunistic";
      Domains = [ "~." ];
    };
  };
}
