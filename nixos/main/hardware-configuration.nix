{ config, lib, pkgs, modulesPath, ... }:
{
  imports = [
    (modulesPath + "/installer/scan/not-detected.nix")
  ];

  boot.initrd.availableKernelModules = [ "xhci_pci" "nvme" "usb_storage" "sd_mod" "rtsx_pci_sdmmc" ];
  boot.initrd.kernelModules = [ ];
  boot.kernelModules = [ "kvm-intel" ];
  boot.extraModulePackages = [ ];

  fileSystems."/" = {
    device = "/dev/disk/by-uuid/4cd964a4-37c6-4a1e-9d40-72595abc52c5";
    fsType = "ext4";
  };

  boot.initrd.luks.devices."luks-657582f9-ca4a-4a68-b0e3-aaff6a05bac6".device = "/dev/disk/by-uuid/657582f9-ca4a-4a68-b0e3-aaff6a05bac6";

  fileSystems."/boot/efi" = {
    device = "/dev/disk/by-uuid/D318-2A11";
    fsType = "vfat";
  };

  swapDevices = [
    { device = "/dev/disk/by-uuid/2a91b83f-c47e-454f-ba2e-0b13b5e96964"; }
  ];

  # Enables DHCP on each ethernet and wireless interface. In case of scripted networking
  # (the default) this is the recommended approach. When using systemd-networkd it's
  # still possible to use this option, but it's recommended to use it in conjunction
  # with explicit per-interface declarations with `networking.interfaces.<interface>.useDHCP`.
  networking.useDHCP = lib.mkDefault true;

  nixpkgs.hostPlatform = lib.mkDefault "x86_64-linux";
  powerManagement.cpuFreqGovernor = lib.mkDefault "powersave";
  hardware.cpu.intel.updateMicrocode = lib.mkDefault config.hardware.enableRedistributableFirmware;

  # High-resolution display.
  hardware.video.hidpi.enable = lib.mkDefault true;
}
