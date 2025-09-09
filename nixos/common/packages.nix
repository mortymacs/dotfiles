{ pkgs, ... }:
{
  list = with pkgs; [
    # Basic.
    nano
    wget
    bc

    # Home manager.
    home-manager

    # Filesystem.
    ntfs3g

    # Virtualisation.
    unstable.qemu

    # Doc.
    man-pages
  ];
}
