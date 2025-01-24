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

    # Audio.
    pamixer

    # Doc.
    man-pages
  ];
}
