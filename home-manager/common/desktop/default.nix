{
  pkgs,
  ...
}:
{
  xsession.enable = false; # Prevent Xorg from being enabled

  home.packages = with pkgs; [
    gnomeExtensions.appindicator
    gnomeExtensions.tiling-shell
    gnomeExtensions.blur-my-shell
    gnomeExtensions.pano
    gnome-tweaks
    wl-clipboard
    unstable.todoist-electron
  ];

  # GTK.
  gtk = {
    enable = true;
    font = {
      name = "Lexend";
      size = 10;
    };
  };

  # dconf.
  dconf = {
    enable = true;
  };

  xdg.configFile = {
    "wallpaper.jpg".source = ./wallpaper.jpg;
    "wallpaper1.jpg".source = ./wallpaper1.jpg;
    "dconf/dconf.dump".source = ./dconf.dump;
  };
}
