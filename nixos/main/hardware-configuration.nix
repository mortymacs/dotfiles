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
      device = "/dev/disk/by-uuid/9f7d9a9d-0633-4e2f-a6d5-ae1375f14c29";
      fsType = "ext4";
    };

  boot.initrd.luks.devices."luks-b623f8d9-f0ff-473e-89f1-12a7d7d5cb00".device =
    "/dev/disk/by-uuid/b623f8d9-f0ff-473e-89f1-12a7d7d5cb00";
  boot.initrd.luks.devices."luks-8f46a68f-7c5e-4746-bd10-078286e0cfc0".device =
    "/dev/disk/by-uuid/8f46a68f-7c5e-4746-bd10-078286e0cfc0";

  fileSystems."/boot" =
    # command: sudo fatlabel /dev/disk/by-uuid/5411-F9C6 BOOT
    {
      device = "/dev/disk/by-uuid/E943-4A85";
      fsType = "vfat";
      options = [
        "fmask=0077"
        "dmask=0077"
      ];
    };

  # Swap.
  swapDevices = [
    { device = "/dev/disk/by-uuid/20c5584d-3bd9-4e83-9b31-8bb2c7f97abe"; }
  ];

  # Network.
  networking.useDHCP = lib.mkDefault true;
  # networking.interfaces.wlp2s0.useDHCP = lib.mkDefault true;

  nixpkgs.hostPlatform = lib.mkDefault "x86_64-linux";
  hardware.cpu.intel.updateMicrocode = lib.mkDefault config.hardware.enableRedistributableFirmware;
}
