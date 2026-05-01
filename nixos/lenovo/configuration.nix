{
  imports = [
    ./hardware-configuration.nix
    ../base
  ];

  networking.hostName = "lenovo";

  system.stateVersion = "25.11";
}
