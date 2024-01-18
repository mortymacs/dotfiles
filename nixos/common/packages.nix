{ pkgs, ... }: {
  list = with pkgs; [
    # Basic.
    pkg-config
    nano
    wget

    # Home manager.
    home-manager

    # Filesystem.
    ntfs3g

    # Audio.
    pamixer
  ];
}
