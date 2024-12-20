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
    "usb_storage"
    "sd_mod"
  ];
  boot.initrd.kernelModules = [ ];
  boot.kernelModules = [ ];
  boot.extraModulePackages = [ ];

  # File systems.
  fileSystems."/" = {
    device = "/dev/disk/by-label/nixos";
    fsType = "ext4";
  };
  boot.initrd.luks.devices = {
    "luksroot" = {
      device = "/dev/disk/by-partlabel/root";
    };
    # Enable swap on luks
    "luks-dc6bb68a-06f0-4011-a2e9-b646b87c2251" = {
      device = "/dev/disk/by-uuid/dc6bb68a-06f0-4011-a2e9-b646b87c2251";
      keyFile = "/crypto_keyfile.bin";
    };
  };
  fileSystems."/boot/efi" = {
    device = "/dev/disk/by-uuid/EADE-DD08";
    fsType = "vfat";
  };
  swapDevices = [ { device = "/dev/disk/by-label/swap"; } ];

  # Network.
  networking.useDHCP = lib.mkDefault true;

  # Platform.
  nixpkgs.hostPlatform = lib.mkDefault "x86_64-linux";
  powerManagement.cpuFreqGovernor = lib.mkDefault "powersave";
  hardware.cpu.intel.updateMicrocode = lib.mkDefault config.hardware.enableRedistributableFirmware;
}
