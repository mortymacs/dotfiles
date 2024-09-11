{ pkgs, ... }: {
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

    # WM.
    swaylock
    swayidle
    swaybg
    mako
    wdisplays
    wayland
    wl-clipboard
  ];
}
