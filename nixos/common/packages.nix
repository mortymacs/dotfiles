{ pkgs, ... }: {
  list = with pkgs; [
    # Basic.
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
