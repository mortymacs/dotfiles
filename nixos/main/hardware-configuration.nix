{ config, lib, pkgs, modulesPath, ... }: {
  imports = [ (modulesPath + "/installer/scan/not-detected.nix") ];

  # Boot settings.
  boot.initrd.availableKernelModules =
    [ "xhci_pci" "nvme" "usb_storage" "sd_mod" "rtsx_pci_sdmmc" ];
  boot.initrd.kernelModules = [ ];
  boot.kernelModules = [ "kvm-intel" ];
  boot.extraModulePackages = [ ];

  # File systems.
  fileSystems."/" = {
    device = "/dev/disk/by-label/nixos";
    fsType = "ext4";
  };
  boot.initrd.luks.devices = {
    luksroot = { device = "/dev/disk/by-partlabel/root"; };
    # Enable swap on luks
    "luks-175a4d67-da09-48ae-ad74-70a2042273ab" = {
      device = "/dev/disk/by-uuid/175a4d67-da09-48ae-ad74-70a2042273ab";
      keyFile = "/crypto_keyfile.bin";
    };
  };
  fileSystems."/boot/efi" = {
    device = "/dev/disk/by-uuid/D318-2A11";
    fsType = "vfat";
  };
  swapDevices = [{ device = "/dev/disk/by-label/swap"; }];

  # Network.
  networking.useDHCP = lib.mkDefault true;

  # Platform.
  nixpkgs.hostPlatform = lib.mkDefault "x86_64-linux";
  powerManagement.cpuFreqGovernor = lib.mkDefault "powersave";
  hardware.cpu.intel.updateMicrocode =
    lib.mkDefault config.hardware.enableRedistributableFirmware;
}
