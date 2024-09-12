{
  config,
  lib,
  pkgs,
  modulesPath,
  ...
}:
{
  imports = [ (modulesPath + "/installer/scan/not-detected.nix") ];

  # Boot settings.
  boot.initrd.availableKernelModules = [
    "xhci_pci"
    "nvme"
    "rtsx_pci_sdmmc"
  ];
  boot.initrd.kernelModules = [ ];
  boot.kernelModules = [ "kvm-intel" ];
  boot.extraModulePackages = [ ];

  # File systems.
  fileSystems."/" = {
    # command: sudo e2label /dev/mapper/luks-20ff081f-165d-4dff-8b2a-b9b1a1d0a1b0 nixos
    device = "/dev/disk/by-label/nixos";
    fsType = "ext4";
  };

  boot.initrd.luks.devices."luks-20ff081f-165d-4dff-8b2a-b9b1a1d0a1b0".device = "/dev/disk/by-uuid/20ff081f-165d-4dff-8b2a-b9b1a1d0a1b0";

  fileSystems."/boot" = {
    # command: sudo fatlabel /dev/disk/by-uuid/5411-F9C6 BOOT
    device = "/dev/disk/by-label/BOOT";
    fsType = "vfat";
    options = [
      "fmask=0077"
      "dmask=0077"
    ];
  };

  # Swap.
  swapDevices = [ ];

  # Network.
  networking.useDHCP = lib.mkDefault true;
  # networking.interfaces.wlp2s0.useDHCP = lib.mkDefault true;

  nixpkgs.hostPlatform = lib.mkDefault "x86_64-linux";
  hardware.cpu.intel.updateMicrocode = lib.mkDefault config.hardware.enableRedistributableFirmware;
}
