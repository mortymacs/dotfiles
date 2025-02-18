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

    # Doc.
    man-pages
  ];
}
