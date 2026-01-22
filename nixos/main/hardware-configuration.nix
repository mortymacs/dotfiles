{
  config,
  lib,
  modulesPath,
  ...
}:
{
  imports = [ (modulesPath + "/installer/scan/not-detected.nix") ];

  # Boot settings.
  boot.initrd.availableKernelModules = [
    "xhci_pci"
    "nvme"
    "usb_storage"
    "usbhid"
    "sd_mod"
    "rtsx_pci_sdmmc"
  ];
  boot.initrd.kernelModules = [ ];
  boot.kernelModules = [ "kvm-intel" ];
  boot.extraModulePackages = [ ];

  # File systems.
  fileSystems."/" =
    # command: sudo e2label /dev/mapper/luks-20ff081f-165d-4dff-8b2a-b9b1a1d0a1b0 nixos
    {
      device = "/dev/mapper/luks-9a1bbc34-eb88-4c47-be0e-c4ab2ab3ff17";
      fsType = "ext4";
    };

  boot.initrd.luks.devices."luks-9a1bbc34-eb88-4c47-be0e-c4ab2ab3ff17".device = "/dev/disk/by-uuid/9a1bbc34-eb88-4c47-be0e-c4ab2ab3ff17";

  fileSystems."/boot" =
    # command: sudo fatlabel /dev/disk/by-uuid/5411-F9C6 BOOT
    {
      device = "/dev/disk/by-uuid/8F34-D599";
      fsType = "vfat";
      options = [
        "fmask=0077"
        "dmask=0077"
      ];
    };

  # Swap.
  swapDevices = [ ];

  nixpkgs.hostPlatform = lib.mkDefault "x86_64-linux";
  hardware.cpu.intel.updateMicrocode = lib.mkDefault config.hardware.enableRedistributableFirmware;
}
