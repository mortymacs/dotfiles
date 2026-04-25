{
  imports = [
    ./hardware-configuration.nix
    ../base
  ];

  networking.hostName = "dell";

  system.stateVersion = "25.11";
}
