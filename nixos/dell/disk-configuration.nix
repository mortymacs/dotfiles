# Declarative disk layout for the Dell machine.
#
# WARNING: Do NOT run `disko --mode disko` on a live system — it will wipe the disk.
# This file only replaces the fileSystems / luks entries in hardware-configuration.nix.
#
# Layout:
#   /dev/nvme0n1p1  vfat (EFI)   → /boot
#   /dev/nvme0n1p2  LUKS → ext4  → /
#
# Fresh install on this machine:
#   1. Boot NixOS installer
#   2. Partition the disk (no git needed — flakes support GitHub URLs):
#        sudo nix --experimental-features "nix-command flakes" run github:nix-community/disko -- --mode disko --flake "github:mortymacs/dotfiles#dell"
#   3. Install the system:
#        sudo nixos-install --flake "github:mortymacs/dotfiles#dell"
#   4. Reboot
#
# Changing LUKS mapper name or partition labels on an already-installed system (i.e. not a fresh install):
#   1. Relabel partitions to match disko's naming convention:
#        sudo sgdisk -c 1:disk-main-ESP /dev/nvme0n1
#        sudo sgdisk -c 2:disk-main-luks /dev/nvme0n1
#   2. Verify: lsblk -o NAME,PARTLABEL /dev/nvme0n1
#   3. Build and install to bootloader (do NOT use `switch`):
#        sudo nixos-rebuild boot --flake ".#dell"
#   4. Reboot
{
  disko.devices = {
    disk = {
      main = {
        type = "disk";
        device = "/dev/nvme0n1"; # verify with: lsblk
        content = {
          type = "gpt";
          partitions = {
            ESP = {
              priority = 1;
              name = "ESP";
              start = "1MiB";
              end = "1GiB";
              type = "EF00";
              content = {
                type = "filesystem";
                format = "vfat";
                mountpoint = "/boot";
                mountOptions = [
                  "fmask=0077"
                  "dmask=0077"
                ];
              };
            };
            luks = {
              size = "100%";
              content = {
                type = "luks";
                name = "cryptroot";
                settings.allowDiscards = true;
                content = {
                  type = "filesystem";
                  format = "ext4";
                  mountpoint = "/";
                };
              };
            };
          };
        };
      };
    };
  };
  # Swap.
  swapDevices = [
    {
      device = "/swapfile";
      size = 16 * 1024; # 16GB
    }
  ];
}
