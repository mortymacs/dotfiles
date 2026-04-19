{
  config,
  lib,
  modulesPath,
  ...
}:

{
  imports = [
    (modulesPath + "/installer/scan/not-detected.nix")
  ];

  boot.initrd.availableKernelModules = [
    "xhci_pci"
    "thunderbolt"
    "nvme"
    "usbhid"
    "usb_storage"
    "sd_mod"
  ];
  boot.initrd.kernelModules = [ ];
  boot.kernelModules = [ "kvm-intel" ];
  boot.extraModulePackages = [ ];

  fileSystems."/" = {
    device = "/dev/mapper/luks-b0626075-eb2b-47bf-9d5c-e35d3904b5d8";
    fsType = "ext4";
  };

  boot.initrd.luks.devices."luks-b0626075-eb2b-47bf-9d5c-e35d3904b5d8".device =
    "/dev/disk/by-uuid/b0626075-eb2b-47bf-9d5c-e35d3904b5d8";

  fileSystems."/boot" = {
    device = "/dev/disk/by-uuid/3761-528C";
    fsType = "vfat";
    options = [
      "fmask=0077"
      "dmask=0077"
    ];
  };

  # Swap.
  swapDevices = [
    {
      device = "/swapfile";
      size = 16 * 1024; # 16GB
    }
  ];

  nixpkgs.hostPlatform = lib.mkDefault "x86_64-linux";
  hardware.cpu.intel.updateMicrocode = lib.mkDefault config.hardware.enableRedistributableFirmware;
}
