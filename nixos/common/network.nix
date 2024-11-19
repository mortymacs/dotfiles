# Source: https://github.com/atkrad/dotfiles/blob/main/nixos/configuration.nix
{ pkgs, ... }:
{
  networking = {
    hostName = "fx";
    nameservers = [
      "1.1.1.1#one.one.one.one"
      "1.0.0.1#one.one.one.one"
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
    dnssec = "false";
    dnsovertls = "opportunistic";
    domains = [ "~." ];
    fallbackDns = [
      "8.8.8.8"
      "2001:4860:4860::8888"
      "8.8.4.4"
      "2001:4860:4860::8844"
    ];
    extraConfig = "MulticastDNS=true";
  };
}
