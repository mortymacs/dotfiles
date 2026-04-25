{ lib, ... }:
{
  imports = [
    ./hardware-configuration.nix
    ../base
  ];

  networking.hostName = "lenovo";

  # GPU driver (NVIDIA + AMD hybrid).
  hardware.graphics = {
    enable = true;
    enable32Bit = true;
  };
  services.xserver.videoDrivers = lib.mkForce [ "nvidia" ];
  hardware.nvidia = {
    modesetting.enable = true;
    powerManagement.enable = true;
    open = true;
    nvidiaSettings = true;
    prime = {
      offload = {
        enable = true;
        enableOffloadCmd = true;
      };
      amdgpuBusId = "PCI:5:0:0";
      nvidiaBusId = "PCI:1:0:0";
    };
  };

  system.stateVersion = "25.11";
}
