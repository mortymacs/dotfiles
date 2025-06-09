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
    "thunderbolt"
    "nvme"
    "usbhid"
    "usb_storage"
    "sd_mod"
  ];
  boot.initrd.kernelModules = [ ];
  boot.kernelModules = [ ];
  boot.extraModulePackages = [ ];

  # File systems.
  fileSystems."/" = {
    device = "/dev/disk/by-uuid/6cc61920-3f08-4a12-bafb-b769f5bb2f99";
    fsType = "ext4";
  };
  boot.initrd.luks.devices."luks-d7c8ebb6-f51c-4099-930d-f12ee9a608b8".device =
    "/dev/disk/by-uuid/d7c8ebb6-f51c-4099-930d-f12ee9a608b8";
  boot.initrd.luks.devices."luks-24bc5def-90ef-4b3b-a4f7-13cecf7c81d9".device =
    "/dev/disk/by-uuid/24bc5def-90ef-4b3b-a4f7-13cecf7c81d9";

  fileSystems."/boot" = {
    device = "/dev/disk/by-uuid/B51E-28C0";
    fsType = "vfat";
    options = [
      "fmask=0077"
      "dmask=0077"
    ];
  };

  swapDevices = [
    { device = "/dev/disk/by-uuid/39c2c2c0-a2fc-4524-9eff-4e1ab5106abe"; }
  ];

  # Network.
  networking.useDHCP = lib.mkDefault true;

  # Platform.
  nixpkgs.hostPlatform = lib.mkDefault "x86_64-linux";
  hardware.cpu.intel.updateMicrocode = lib.mkDefault config.hardware.enableRedistributableFirmware;
}
